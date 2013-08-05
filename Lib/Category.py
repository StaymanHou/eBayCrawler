import MySQLdb
import Mydb

class Category(object):
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
    
    def StaticUpdateAndGetNtP(datadict):
        categorydict = {}
        catonedict = {}
        for value in datadict.values():
            for k, v in value['CATEGORY'].items():
                catonedict[k] = 0
                if k not in categorydict: categorydict[k] = v
                else: categorydict[k] = dict(categorydict[k].items()+v.items())
        fmtstr = ','.join(['%s'] * len(catonedict))
        cur = Mydb.MydbExec(("SELECT TITLE, PK FROM goodscategorylevelone WHERE TITLE IN (%s)"%fmtstr, tuple(catonedict.keys())))
        rows = cur.fetchall()
        for row in rows:
            if row['TITLE'] in catonedict: catonedict[row['TITLE']] = row['PK']
        catoneremainlist = [key for key in catonedict.keys() if catonedict[key]==0]
        if len(catoneremainlist)>0:
            fmtstr = ','.join(['(%s)'] * len(catoneremainlist))
            cur = Mydb.MydbExec(("INSERT INTO goodscategorylevelone (TITLE) VALUES %s"%fmtstr, tuple(catoneremainlist)))
            cur = Mydb.MydbExec(("SELECT TITLE, PK FROM goodscategorylevelone WHERE TITLE IN (%s)"%fmtstr, tuple(catoneremainlist)))
            rows = cur.fetchall()
            for row in rows:
                if row['TITLE'] in catonedict: catonedict[row['TITLE']] = row['PK']
        cattwolist = []
        for key, value in categorydict.items():
            cattwolist.extend([str(catonedict[key])+'@'+k for k in value.keys()])
        cattwodict = dict((cattwo,0) for cattwo in set(cattwolist))
        fmtstr = ','.join(['%s'] * len(cattwodict))
        cur = Mydb.MydbExec(("SELECT CONCAT( `SUB_HEADING` , '@', `TITLE` ) AS CONCAT, PK FROM goodscategoryleveltwo WHERE CONCAT( `SUB_HEADING` , '@', `TITLE` ) IN (%s)"%fmtstr, tuple(cattwodict.keys())))
        rows = cur.fetchall()
        for row in rows:
            if row['CONCAT'] in cattwodict: cattwodict[row['CONCAT']] = row['PK']
        cattworemainlist = [key for key in cattwodict.keys() if cattwodict[key]==0]
        if len(cattworemainlist)>0:
            fmtstr = ','.join(['(%s,%s)'] * len(cattworemainlist))
            fmtparlst = []
            for cattwo in cattworemainlist: fmtparlst.extend(cattwo.split('@'))
            cur = Mydb.MydbExec(("INSERT INTO goodscategoryleveltwo (SUB_HEADING, TITLE) VALUES %s"%fmtstr, tuple(fmtparlst)))
            fmtstr = ','.join(['%s'] * len(cattworemainlist))
            cur = Mydb.MydbExec(("SELECT CONCAT( `SUB_HEADING` , '@', `TITLE` ) AS CONCAT, PK FROM goodscategoryleveltwo WHERE CONCAT( `SUB_HEADING` , '@', `TITLE` ) IN (%s)"%fmtstr, tuple(cattworemainlist)))
            rows = cur.fetchall()
            for row in rows:
                if row['CONCAT'] in cattwodict: cattwodict[row['CONCAT']] = row['PK']
        for key, value in categorydict.items():
            for k in value.keys():
                categorydict[key][k] = cattwodict[str(catonedict[key])+'@'+k]
        return categorydict
            
    UpdateAndGetNtP = staticmethod(StaticUpdateAndGetNtP)
