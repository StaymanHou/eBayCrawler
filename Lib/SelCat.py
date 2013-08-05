import MySQLdb
import Mydb

class SelCat(object):
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
    
    def StaticUpdate(datadict, sellerntp, catntp):
        sclist = []
        for key, value in datadict.items():
            for k, v in value['CATEGORY'].items():
                for ktwo, q in v.items():
                    sclist.append(sellerntp[key])
                    sclist.append(catntp[k][ktwo])
                    sclist.append(int(q))
        fmtstr = ','.join(['(%s,%s,%s)'] * (len(sclist)/3))
        cur = Mydb.MydbExec(("INSERT INTO sellercategory (SELLER, SUB_CATEGORY, QUANTITY) VALUES %s"%fmtstr, tuple(sclist)))
        return 0
            
    Update = staticmethod(StaticUpdate)
