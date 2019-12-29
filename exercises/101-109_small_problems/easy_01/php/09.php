<?php
function sum($num) {
    $nums = str_split($num);
    return array_reduce($nums, function($carry, $item) {
        $int = (int)$item;
        $carry += $int;
        return $carry;
    });
}

$args = [23, 496, 123456789];

foreach($args as $arg) {
    echo sum($arg)."\n";
}
?>
