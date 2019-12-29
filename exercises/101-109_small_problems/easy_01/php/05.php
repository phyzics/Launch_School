<?php
function reverse_sentence($sentence) {
    $words = explode(" ", $sentence);
    $reversed = array_reverse($words);
    return implode(" ", $reversed);
}

$args = ['', 'Hello World', 'Reverse these words'];

foreach ($args as $arg) {
    echo reverse_sentence($arg)."\n";
}
?>
