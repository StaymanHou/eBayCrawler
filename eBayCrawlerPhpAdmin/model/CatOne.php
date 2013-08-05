<?php
class CatOne
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
    public static function getlist()
    {
        $lst = array();

        $query = "SELECT PK, TITLE FROM `goodscategorylevelone` ORDER BY TITLE ASC";
        $result = mysql_query($query, $GLOBALS['DB']);
        while ($row = mysql_fetch_assoc($result)) {
            array_push($lst, $row);
        }
        
        mysql_free_result($result);

        return $lst;
    }
}
?>
