<?php
// start or join the session
session_start();
header('Cache-control: private');

// issue 401 error if user has not been authenticated
if (!isset($_SESSION['access']) || $_SESSION['access'] != TRUE)
{
    header('HTTP/1.0 401 Authorization Error');

    $GLOBALS['TEMPLATE']['extra_head'] = '<script type="text/javascript" ' .
        'src="js/401.js"></script>';
    ob_start();
?>
<p>The resource you've requested requires user authentication. Either you have
not supplied the necessary credentials or the credentials you have supplied
does not authorize you for access.</p>

<p><strong>You will be redirected to the log in page in 
<span id="secondsDisplay">10 seconds</span>.</strong></p>

<p>If you are not automatically taken there, please click on the following
link: <a href="login.php">Log In</a></p>
<?php
    $GLOBALS['TEMPLATE']['content'] = ob_get_contents();
    ob_end_clean();

    include '../templates/template-page.php';
    exit();
}
?>
