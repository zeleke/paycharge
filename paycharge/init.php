<?php
$db = new PDO('mysql:host=localhost;dbname=paycharge', 'paycharger', 'nigger');

//Error reporting
error_reporting(E_ALL);
ini_set('display_errors', 'on');

//Locale
setlocale(LC_MONETARY, 'en_US.UTF-8');
date_default_timezone_set('America/Los_Angeles');

//Utility
function logger($s) {
    echo "<p>$s</p>";
}

function days_in_prev_mo($t) {
    //Takes time
    //Returns integer day

    $m = intval(date('n', $t)) - 1;
    $new_date_str = date("Y-", $t) . $m;
    $ret = date('t', strtotime($new_date_str));
    return $ret;
}
?>
