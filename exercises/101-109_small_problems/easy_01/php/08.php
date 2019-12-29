<?php
function average($nums) {
    $total = count($nums);
    $sum = array_reduce($nums, function($carry, $num) {
        $carry += $num;
        return $carry;
    });
    return floor($sum / $total);
}

$args = [
    [1, 5, 87, 45, 8, 8],
    [9, 47, 23, 95, 16, 52],
];

foreach ($args as $arg) {
    echo average($arg)."\n";
}
?>
