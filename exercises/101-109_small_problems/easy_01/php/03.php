<?php
function digit_list($num) {
    $digits = str_split($num);
    $digits = array_map(function($n) {
        return (int)$n;
    }, $digits);
    return $digits;
}

$args = [12345, 7, 375290, 444];

for ($i=0; $i < count($args); $i++) {
    $arg = $args[$i];
    print_r(digit_list($arg));
}
?>
