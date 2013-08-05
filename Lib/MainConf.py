import MySQLdb
import Mydb

class MainConf(object):
    def __init__(self):
        self.pk=None
        self.fields={}

    def __getitem__(self,field):
        if field == 'PK':
            return self.pk
        else:
            if field in self.fields:
                return self.fields[field]

    def __setitem__(self,field,value):
        if field == 'PK':
            self.pk = value
        else:
            self.fields[field] = value
    
    def StaticGet():
	mc = MainConf()
        cur = Mydb.MydbExec(("SELECT PK, TITLE, PAGE_LOAD_INTERVAL, CACHE_SIZE, ITEM_LIMIT, FLAG_PAUSE FROM mainconf WHERE PK = 1",))
        if cur.rowcount:
            row = cur.fetchone()
            mc['PK'] = row['PK']
            mc['TITLE'] = row['TITLE']
            mc['PAGE_LOAD_INTERVAL'] = row['PAGE_LOAD_INTERVAL']
            mc['CACHE_SIZE'] = row['CACHE_SIZE']
            mc['ITEM_LIMIT'] = row['ITEM_LIMIT']
            mc['FLAG_PAUSE'] = row['FLAG_PAUSE']
        return mc

    Get = staticmethod(StaticGet)


