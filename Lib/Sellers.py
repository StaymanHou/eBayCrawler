import MySQLdb
import Mydb

class Sellers(object):
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
        sellerdict = {}
        for key, value in datadict.items():
            sellerdict[key] = (key, int(value['SCORE']), float(value['AVERAGE_PRICE']))
        fmtstr = ','.join(['%s'] * len(sellerdict))
        cur = Mydb.MydbExec(("SELECT USERNAME FROM sellers WHERE USERNAME IN (%s)"%fmtstr, tuple(sellerdict.keys())))
        rows = cur.fetchall()
        for row in rows:
            if row['USERNAME'] in sellerdict: del sellerdict[row['USERNAME']]
        if len(sellerdict) == 0: return []
        fmtstr = ','.join(['(%s,%s,%s)'] * len(sellerdict))
        fmtparlst = []
        for value in sellerdict.values(): fmtparlst.append(value[0]); fmtparlst.append(value[1]); fmtparlst.append('%.2f'%value[2]);
        cur = Mydb.MydbExec(("INSERT INTO sellers (USERNAME, SCORE, AVERAGE_PRICE) VALUES %s"%fmtstr, tuple(fmtparlst)))
        fmtstr = ','.join(['%s'] * len(sellerdict))
        cur = Mydb.MydbExec(("SELECT PK, USERNAME FROM sellers WHERE USERNAME IN (%s)"%fmtstr, tuple(sellerdict.keys())))
        rows = cur.fetchall()
        for row in rows:
            sellerdict[row['USERNAME']] = row['PK']
        return sellerdict

    UpdateAndGetNtP = staticmethod(StaticUpdateAndGetNtP)

    def StaticGetTotalNum():
        cur = Mydb.MydbExec(("SELECT COUNT(*) AS COUNT FROM sellers",))
        num = cur.fetchone()['COUNT']
        return num

    GetTotalNum = staticmethod(StaticGetTotalNum)
    
    def Staticcheckseller(sellerlist):
        fmtstr = ','.join(['%s'] * len(sellerlist))
        cur = Mydb.MydbExec(("SELECT USERNAME FROM sellers WHERE USERNAME IN (%s)"%fmtstr,tuple(sellerlist)))
        return cur.fetchall()

    checkseller = staticmethod(Staticcheckseller)

