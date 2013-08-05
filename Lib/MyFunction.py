from datetime import datetime, timedelta
import os

def floorbyhour(input_datetime):
    d = timedelta(seconds=(input_datetime.minute*60+input_datetime.second),microseconds=input_datetime.microsecond)
    return input_datetime-d

def floorbyday(input_datetime):
    d = timedelta(seconds=(input_datetime.hour*3600+input_datetime.minute*60+input_datetime.second),microseconds=input_datetime.microsecond)
    return input_datetime-d

def file2list(file_path,NoDup=True):
    mylst = []
    if not os.path.exists(file_path):
        open(file_path,'w')
    lines = open(file_path).readlines()
    for line in lines:
        if line.strip()!='':
            mylst.append(line.strip())
    if NoDup:
        temp_dict = {}
        for item in mylst:
            temp_dict[item] = 0
        mylst = []
        for key in temp_dict.keys():
            mylst.append(key)
    return mylst

def Username2Userid(l_username):
    import requests
    import re
    import bsddb
    db = bsddb.hashopen('name2id.db')
    if l_username in db:
        if db[l_username][0] == '-':
            return abs(int(db[l_username]))
        else: 
            return unicode(db[l_username])
    l_url = 'https://twitter.com/'+l_username
    try: l_r = requests.get(l_url)
    except: return -1
    m = re.search('<div class="profile-card-inner" data-screen-name=".+?" data-user-id=".+?">',l_r.text)
    if m == None:
        db[l_username] = str(-l_r.status_code)
        return l_r.status_code
    m = re.search('data-user-id=".+?"',m.group(0))
    m = m.group(0)[14:-1]
    if len(m)>0:
        db[l_username] = m
        return m
    db[l_username] = str(-l_r.status_code)
    return l_r.status_code

def timetoclock(cal_time):
    return int(cal_time/3600)%24









######################################




def randpick(pick_num,orig_list):
    from random import sample
    return sample(orig_list, pick_num)


