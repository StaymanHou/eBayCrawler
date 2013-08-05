Mydb_host = 'localhost'
Mydb_username = 'MyUser'
Mydb_password = 'ZwV2pZJrVWNG5t3W'
Mydb_db = 'MyUser_eBaySellerData'

def MydbExec(exetuple):
    import MySQLdb
    con = MySQLdb.connect(Mydb_host,Mydb_username,Mydb_password,Mydb_db)
    con.autocommit(True)
    cur = con.cursor(MySQLdb.cursors.DictCursor)
    try:
        cur.execute(*exetuple)
    except Exception, e:
        print str(exetuple)
        raise Exception('DBquery execute error', e)
    con.close()
    return cur

def MydbCon():
    import MySQLdb
    con = MySQLdb.connect(Mydb_host,Mydb_username,Mydb_password,Mydb_db)
    con.autocommit(True)
    return con

