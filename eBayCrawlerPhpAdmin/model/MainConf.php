<?php
class MainConf
{
    private $PK;     // user id
    private $fields;  // other record fields

    // initialize a User object
    public function __construct()
    {
        $this->PK = null;
        $this->fields = array('TITLE' => '',
                              'PAGE_LOAD_INTERVAL' => 1,
                              'CACHE_SIZE' => 50,
                              'ITEM_LIMIT' => 10000,
                              'FLAG_PAUSE' => 0);
    }

    // override magic method to retrieve properties
    public function __get($field)
    {
        if ($field == 'PK')
        {
            return $this->PK;
        }
        else 
        {
            return $this->fields[$field];
        }
    }

    // override magic method to set properties
    public function __set($field, $value)
    {
        if (array_key_exists($field, $this->fields))
        {
            $this->fields[$field] = $value;
        }
    }

    // return an object populated based on the record's user id
    public static function get()
    {
        $mc = new MainConf();

        $query = 'SELECT `TITLE`, `PAGE_LOAD_INTERVAL`, `CACHE_SIZE`, `ITEM_LIMIT`, `FLAG_PAUSE` FROM `mainconf` WHERE `PK`=1';
        $result = mysql_query($query, $GLOBALS['DB']);

        if (mysql_num_rows($result))
        {
            $row = mysql_fetch_assoc($result);
            $mc->TITLE = $row['TITLE'];
            $mc->PAGE_LOAD_INTERVAL = $row['PAGE_LOAD_INTERVAL'];
            $mc->CACHE_SIZE = $row['CACHE_SIZE'];
            $mc->ITEM_LIMIT = $row['ITEM_LIMIT'];
            $mc->FLAG_PAUSE = $row['FLAG_PAUSE'];
            $mc->PK = 1;
        }
        mysql_free_result($result);

        return $mc;
    }

    public function save()
    {
        if ($this->PK)
        {
            $query = sprintf('UPDATE `mainconf` SET `TITLE`="%s",`PAGE_LOAD_INTERVAL`=%d,`CACHE_SIZE`=%d,`ITEM_LIMIT`=%d,`FLAG_PAUSE`=%d WHERE `PK`=1',
                $this->TITLE,
                $this->PAGE_LOAD_INTERVAL,
                $this->CACHE_SIZE,
                $this->ITEM_LIMIT,
                $this->FLAG_PAUSE);
            mysql_query($query, $GLOBALS['DB']);
        }
    }
}
?>
