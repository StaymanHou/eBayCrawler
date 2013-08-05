import requests
from lxml import etree
from Queue import Queue
import logging
from time import sleep
from Lib.MyFunction import file2list
from Lib.MainConf import MainConf
from datetime import datetime
import re
from Lib.Category import *
from Lib.Sellers import *
from Lib.SelCat import *

DEBUG_MODE = False

logging.basicConfig(format='%(asctime)s %(levelname)-8s %(message)s',filename='log.txt',datefmt='%m/%d/%Y %I:%M:%S %p',level=logging.WARNING)
console = logging.StreamHandler()
console.setLevel(logging.WARNING)
formatter = logging.Formatter('%(asctime)s %(levelname)-8s %(message)s')
console.setFormatter(formatter)
logging.getLogger('').addHandler(console)

FLAG_EXIT = False
keywordQueue = Queue()
itemQueue = Queue()
keywordList = file2list('keyword_list.txt')
for keyword in keywordList:
    keywordQueue.put(keyword)
finishedkeywordpath = 'finished_keyword_list.txt'

SELLERLIST = []
MC = MainConf.Get()
DATACACHE = {}

def storedata(datadict):
    if DEBUG_MODE: print 'store data:', datadict
    sellerntp = Sellers.UpdateAndGetNtP(datadict)
    if len(sellerntp) == 0: return -1 # no new seller
    catntp = Category.UpdateAndGetNtP(datadict)
    if DEBUG_MODE:
        print 'write datadict, sellerntp, catntp';
        open('datadict','w').write(str(datadict));
        open('sellerntp','w').write(str(sellerntp));
        open('catntp','w').write(str(catntp));
    SelCat.Update(datadict, sellerntp, catntp)
    logging.warn('storing data. Total: %d'%(Sellers.GetTotalNum()))
    return 0
    
def getsellerdetail(sellerlist):
    # why seller in db still collected again?
    global MC
    global DATACACHE
    if DEBUG_MODE: print 'get seller detail:', sellerlist
    MC = MainConf.Get()
    while MC['FLAG_PAUSE']:
        print 'pause for 1 min.'
        sleep(60)
        MC =  MainConf.Get()
    if len(DATACACHE)>=MC['CACHE_SIZE']:
        storedata(DATACACHE)
        DATACACHE = {}
    sellerset = set(sellerlist)
    # exclude the sellers who have already been collected
    sellerset = [seller for seller in sellerset if seller not in DATACACHE]
    recordedsellerlist = Sellers.checkseller(sellerset)
    recordedsellerlist = [seller['USERNAME'] for seller in recordedsellerlist]
    sellerset = [seller for seller in sellerset if seller not in recordedsellerlist]
    # extract data from seller set
    for seller in sellerset:
        print 'seller:', seller
        url = 'http://www.ebay.com/sch/'+seller+'/m.html'
        sleep(MC['PAGE_LOAD_INTERVAL'])
        try: r = requests.get(url)
        except: logging.warn('connection error when get seller detail'); continue;
        if r.status_code != 200: logging.warn('unexpect response when get seller detail %d'%r.status_code); continue;
        htmltree = etree.HTML(r.text)
        sellerdata = {'SCORE':0, 'AVERAGE_PRICE':0.0, 'CATEGORY':{}}
        elems = htmltree.xpath('//a[@class="fbscore"]')
        if len(elems) == 0:
            sellerdata['CATEGORY'] = {'NO CATEGORY 1': {'NO CATEGORY 2': 0}}
            DATACACHE[seller] = sellerdata
            continue
        sellerdata['SCORE'] = elems[0].text
        elems = htmltree.xpath('//div[@itemprop="price"]')
        pricelst = [float(re.sub(r'[^\d.]', '', elem.text)) for elem in elems]
        if len(pricelst)==0: sellerdata['AVERAGE_PRICE'] = 0
        else: sellerdata['AVERAGE_PRICE'] = sum(pricelst) / float(len(pricelst))
        catdict = {}
        elems = htmltree.xpath('//div[@class="catsgroup"]')
        for elem in elems:
            innerhtmltree = etree.HTML(etree.tostring(elem))
            catleveloneelems = innerhtmltree.xpath('//a[../@class="cat-t"]')
            if len(catleveloneelems)==0: continue
            catlevelone = catleveloneelems[0].text
            catdict[catlevelone] = {}
            catleveltwoelems = innerhtmltree.xpath('//div[@class="cat-link"]')
            for catleveltwoelem in catleveltwoelems:
                lasthtmltree = etree.HTML(etree.tostring(catleveltwoelem))
                cat2nameelem = lasthtmltree.xpath('//a')
                cat2name = cat2nameelem[0].text
                cat2numelem = lasthtmltree.xpath('//span')
                cat2num = re.sub(r'[^\d.]', '', cat2numelem[0].text)
                catdict[catlevelone][cat2name] = cat2num
        sellerdata['CATEGORY'] = catdict
        DATACACHE[seller] = sellerdata
    return 0

print 'eBayCrawler Start!'

while not keywordQueue.empty():
    keyword = keywordQueue.get()
    if DEBUG_MODE: print 'keyword:', keyword
    pagenum = 0
    itemnum = 0
    counter = 0
    while 1:
        if DEBUG_MODE: print 'pagenum:', pagenum
        pagenum += 1
        if counter>itemnum or counter>MC['ITEM_LIMIT']: break
        url = 'http://www.ebay.com/sch/i.html?_nkw='+keyword+'&_pgn='+str(pagenum)+'&_skc='+str(counter)+'&rt=nc'
        sleep(MC['PAGE_LOAD_INTERVAL'])
        try: r = requests.get(url)
        except: logging.warn('connection error when get page'); continue;
        if r.status_code != 200: logging.warn('unexpect response when get page %d'%r.status_code); continue;
        htmltree = etree.HTML(r.text)
        if pagenum == 1: elems = htmltree.xpath('//span[@class="rcnt"]'); itemnum = int(elems[0].text.replace(',', ''));
        elems = htmltree.xpath('//a[@itemprop="name"]')
        for elem in elems:
            itemQueue.put(elem.get('href'))
        while not itemQueue.empty():
            counter += 1
            print counter
            url = itemQueue.get()
            sleep(MC['PAGE_LOAD_INTERVAL'])
            try: r = requests.get(url)
            except: logging.warn('connection error when get item'); continue;
            if r.status_code != 200: logging.warn('unexpect response when get item %d'%r.status_code); continue;
            # do something to extract data
            htmltree = etree.HTML(r.text)
            elem = htmltree.xpath('//span[@class="mbg-nw"]')
            name = elem[0].text
            SELLERLIST.append(name)
        # process seller list
        getsellerdetail(SELLERLIST)
        SELLERLIST = []
        if FLAG_EXIT: break;
    # finish one keyword
    open(finishedkeywordpath, 'a').write(keyword.encode('ascii', 'replace')+'\n')
    if FLAG_EXIT: break;
    
print 'eBayCrawler Exit!'

