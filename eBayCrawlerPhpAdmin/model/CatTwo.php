<?php
class CatTwo
{
    private $PK;
    private $fields;

    // initialize a User object
    public function __construct()
    {
        $this->PK = null;
        $this->fields = array('TITLE' => null);
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
    public static function getlist($catonepk)
    {
        if (empty($catonepk)) {return array();}
        
        $lst = array();

        $query = sprintf("SELECT PK, TITLE FROM `goodscategoryleveltwo` WHERE SUB_HEADING = %d ORDER BY TITLE ASC", $catonepk);
        $result = mysql_query($query, $GLOBALS['DB']);
        while ($row = mysql_fetch_assoc($result)) {
            array_push($lst, $row);
        }
        
        mysql_free_result($result);

        return $lst;
    }
}
?>
