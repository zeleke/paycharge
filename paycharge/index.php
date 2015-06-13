<?php
include_once "init.php";

/*
for($t = time(), $day = date('j', $t), $bound = days_in_prev_mo($t); $day < $bound; $t -= 86400, $day = date('j', $t)) {
    logger("Date..." . date("m/d/Y", $t) . "; Day...$day; Time...$t; Bound...$bound");
}
 */


for($t = time(), $bound = 5, $day = date('j', $t); $day > $bound; $t -= 86400, $day = date('j', $t)) {
    logger("Time: $t, Day: $day, Bound: $bound");
}
phpinfo();
?>
