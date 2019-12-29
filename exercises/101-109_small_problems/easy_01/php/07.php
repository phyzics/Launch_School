<?php
function stringy($num) {
    $str = "";
    for ($i=0; $i < $num; $i++) {
        if ($i % 2 === 0) {
            $str = $str."1";
        } else {
            $str = $str."0";
        }
    }
    return $str;
}

$args = [6, 9, 4, 7];

foreach($args as $arg) {
    echo stringy($arg)."\n";
}
?>
