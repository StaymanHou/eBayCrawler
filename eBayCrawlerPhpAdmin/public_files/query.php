<?php

include '../lib/common.php';
include '../lib/db.php';
include '../model/Query.php';

$GLOBALS['TEMPLATE']['jsheader'] = '<script type="text/javascript" src="js/jquery.js"></script><script type="text/javascript" src="js/query.js"></script>';

$GLOBALS['TEMPLATE']['title'] = 'Search Result';
$GLOBALS['TEMPLATE']['ContentViewFile'] = 'template-query.php';

$method = (isset($_GET['method'])) ? $_GET['method'] : null;

if ($method=='search')
{
    $GLOBALS['TEMPLATE']['Content']['SellerDict']=
        Query::getsellerdict($_POST['LIMIT'],
                             $_POST['SCORE_LOW'],
                             $_POST['SCORE_HIGH'],
                             $_POST['AVERAGE_PRICE_LOW'],
                             $_POST['AVERAGE_PRICE_HIGH'],
                             $_POST['CATONE'],
                             $_POST['CATTWO'],
                             $_POST['QUANTITY'],
                             $_POST['USED_TIME_FROM'],
                             $_POST['USED_TIME_TO'],
                             $_POST['ORDER']);
    include '../view/template-page.php';
}
else if ($method=='downloadandmarkuse')
{
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename=eBaySeller_".time().".csv");
    header("Pragma: no-cache");
    header("Expires: 0");

    $pk_list = $_POST['pk_list'];
    $seller_list = Query::downloadandmarkusesellers($pk_list);
    foreach ($seller_list as $seller) {
        echo $seller . "\n";
    }
}
else
{
    header('HTTP/1.0 403 Forbidden');
}

?>


