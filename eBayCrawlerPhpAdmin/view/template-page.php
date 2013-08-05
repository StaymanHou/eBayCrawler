<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
  <title>
<?php
if (!empty($GLOBALS['TEMPLATE']['title']))
{
    echo $GLOBALS['TEMPLATE']['title'];
}
?>
  </title>
  <link rel="stylesheet" type="text/css" href="css/styles.css"/>
<?php
if (!empty($GLOBALS['TEMPLATE']['exheader']))
{
    echo $GLOBALS['TEMPLATE']['exheader'];
}
?>
 </head>
 <body>
  <div id="wrapper">
   <div id="header">
    <div id="navigation">
<?php include '../view/template-nav.php'; ?>
    </div>
    <div id="title">
<?php
if (!empty($GLOBALS['TEMPLATE']['title']))
{
    echo '<h1>' . $GLOBALS['TEMPLATE']['title'] . '</h1>';
}
?>
    </div>
   </div>
   <div id="content">
<?php
if (isset($GLOBALS['TEMPLATE']['ContentViewFile'])&&!empty($GLOBALS['TEMPLATE']['ContentViewFile']))
{
    include '../view/' . $GLOBALS['TEMPLATE']['ContentViewFile'];
}
?>
   </div>
   <div id="footer">Copyright &copy; Stayman Hou <?php echo date('Y'); ?></div>
  </div>
<?php
if (!empty($GLOBALS['TEMPLATE']['jsheader']))
{
    echo $GLOBALS['TEMPLATE']['jsheader'];
}
?>
 </body>

</html>
