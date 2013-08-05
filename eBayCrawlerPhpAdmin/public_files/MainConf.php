<?php

include '../lib/common.php';
include '../lib/db.php';
include '../model/MainConf.php';

$method = (isset($_GET['method'])) ? $_GET['method'] : null;

if ($method=='get')
{
    $GLOBALS['TEMPLATE']['title'] = 'Modify Main Config';
    $GLOBALS['TEMPLATE']['ContentViewFile'] = 'template-MainConf.php';

    $GLOBALS['TEMPLATE']['Content']['MainConf'] = MainConf::get();

    include '../view/template-page.php';
}
else if ($method=='save'&&isset($_POST['submitted']))
{
    $mc = MainConf::get();
    $mc->TITLE = $_POST['TITLE'];
    $mc->PAGE_LOAD_INTERVAL = $_POST['PAGE_LOAD_INTERVAL'];
    $mc->CACHE_SIZE = $_POST['CACHE_SIZE'];
    $mc->ITEM_LIMIT = $_POST['ITEM_LIMIT'];
    $mc->FLAG_PAUSE = $_POST['FLAG_PAUSE'];
    $mc->save();
    header('Location: index.php');
}
else
{
   header('HTTP/1.0 403 Forbidden');
}

?>
