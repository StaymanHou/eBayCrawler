<?php

include '../lib/common.php';
include '../lib/db.php';
include '../model/CatTwo.php';

$catone = (isset($_GET['catone'])) ? $_GET['catone'] : null;

if ($catone=='--')
{
    echo json_encode(array());
    header('Content-Type: application/json');
}
else if (!empty($catone))
{
    $CatTwoList = CatTwo::getlist($catone);
    echo json_encode($CatTwoList);
    header('Content-Type: application/json');
}
else
{
   header('HTTP/1.0 403 Forbidden');
}

?>
