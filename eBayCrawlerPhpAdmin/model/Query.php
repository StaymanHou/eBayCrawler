<?php
class Query
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
    public static function getsellerdict($limit=100,$score_low=null,$score_high=null,$average_price_low=null,$average_price_high=null,$catone=null,$cattwo=null,$quantity=null,$used_time_from=null,$used_time_to=null,$order='ASC')
    {
        $lst = array();
        
        $query = 'SELECT DISTINCT SELLER FROM sellercategory INNER JOIN goodscategoryleveltwo ON sellercategory.SUB_CATEGORY=goodscategoryleveltwo.PK INNER JOIN sellers ON sellercategory.SELLER=sellers.PK WHERE 1';
        
        if (!empty($score_low)) {
            $query .= sprintf(' AND sellers.SCORE>%d',$score_low);
        }
        if (!empty($score_high)) {
            $query .= sprintf(' AND sellers.SCORE<%d',$score_high);
        }
        if (!empty($average_price_low)) {
            $query .= sprintf(' AND sellers.AVERAGE_PRICE>%d',$average_price_low);
        }
        if (!empty($average_price_high)) {
            $query .= sprintf(' AND sellers.AVERAGE_PRICE<%d',$average_price_high);
        }
        if ((!empty($catone))&&($catone!='--')) {
            $query .= sprintf(' AND goodscategoryleveltwo.SUB_HEADING=%d',$catone);
            if ((!empty($cattwo))&&($cattwo!='--')) {
                $query .= sprintf(' AND SUB_CATEGORY=%d',$cattwo);
            }
        }
        if (!empty($quantity)) {
            $query .= sprintf(' AND QUANTITY=%d',$quantity);
        }
        if (empty($used_time_from)&&empty($used_time_to)) {
            $query .= ' AND sellers.USED_TIME IS NULL';
        } else {
            if (!empty($used_time_from)) {
                $query .= sprintf(' AND sellers.USED_TIME>"%s"',$used_time_from);
            }
            if (!empty($used_time_to)) {
                $query .= sprintf(' AND sellers.USED_TIME<"%s"',$used_time_to);
            }
        }
        $query .= sprintf(' ORDER BY sellers.PK %s',$order);
        $query .= sprintf(' LIMIT %d',$limit);

        $result = mysql_query($query, $GLOBALS['DB']);
        while ($row = mysql_fetch_assoc($result)) {
            array_push($lst, $row['SELLER']);
        }
        
        mysql_free_result($result);        
        
        $dct = array();
        
        if (count($lst)==0) {return $dct;}
        
        $ids = join(',',$lst);
        $query = "SELECT sellercategory.SELLER AS sellerpk, sellers.USERNAME AS username, sellers.SCORE AS score, sellers.AVERAGE_PRICE AS price, sellers.USED_TIME AS used_time, goodscategorylevelone.TITLE AS catone, goodscategoryleveltwo.TITLE AS cattwo, sellercategory.QUANTITY AS quantity FROM sellercategory INNER JOIN goodscategoryleveltwo ON sellercategory.SUB_CATEGORY=goodscategoryleveltwo.PK INNER JOIN goodscategorylevelone ON goodscategoryleveltwo.SUB_HEADING=goodscategorylevelone.PK INNER JOIN sellers ON sellercategory.SELLER=sellers.PK WHERE sellercategory.SELLER IN ($ids) ORDER BY sellerpk ASC";

        $result = mysql_query($query, $GLOBALS['DB']);
        while ($row = mysql_fetch_assoc($result)) {
            if (array_key_exists($row['sellerpk'], $dct)) {
                if (!array_key_exists($row['catone'], $dct[$row['sellerpk']]['category'])) {
                    $dct[$row['sellerpk']]['category'][$row['catone']] = array();
                }
                $dct[$row['sellerpk']]['category'][$row['catone']][$row['cattwo']] = $row['quantity'];
            } else {
                $dct[$row['sellerpk']] = array('username' => $row['username'],
                                          'score' => $row['score'],
                                          'price' => $row['price'],
                                          'used_time' => $row['used_time'],
                                          'category' => array($row['catone'] => array($row['cattwo'] => $row['quantity']))
                                          );
            }
        }
        
        mysql_free_result($result);

        return $dct;
    }
    
    public static function downloadandmarkusesellers($pk_list)
    {
        if (count($pk_list)==0) {
            return array('No Result');
        }
        
        $ids = join(',',$pk_list);
        $query = "UPDATE sellers SET USED_TIME=NOW() WHERE PK IN ($ids)";
        $result = mysql_query($query, $GLOBALS['DB']);
        
        $seller_list = array();
        
        $query = "SELECT USERNAME FROM sellers WHERE PK IN ($ids)";
        $result = mysql_query($query, $GLOBALS['DB']);
        while ($row = mysql_fetch_assoc($result)) {
            array_push($seller_list, $row['USERNAME']);
        }
        
        mysql_free_result($result);
        
        return $seller_list;
    }
}
?>
