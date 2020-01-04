<?php
function cprompt($str) {
    echo ">> $str\n";
}

cprompt("Please enter an integer greater than 0:");
$limit = (int)fgets(STDIN);
$arr = range(1, $limit);

cprompt("Enter 's' to compute the sum, 'p' to compute the product.");
$operation = trim(fgets(STDIN));
if ($operation === "s") {
    $result = array_reduce($arr, function($carry, $item) {
        $carry += $item;
        return $carry;
    });
    echo "The sum of the integers between 1 and $limit is $result\n";
} else {
    $result = array_reduce($arr, function($carry, $item) {
        $carry *= $item;
        return $carry;
    }, 1);
    echo "The product of the integers between 1 and $limit is $result\n";
}
?>
