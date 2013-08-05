<?php

include '../lib/common.php';
include '../lib/db.php';
include '../model/CatOne.php';

$GLOBALS['TEMPLATE']['jsheader'] = '<script type="text/javascript" src="js/jquery.js"></script>';

$GLOBALS['TEMPLATE']['title'] = 'Welcome! This is eBayCrawler';
$GLOBALS['TEMPLATE']['ContentViewFile'] = 'template-index.php';

$GLOBALS['TEMPLATE']['Content']['CatOneList'] = CatOne::getlist();

include '../view/template-page.php';

?>
