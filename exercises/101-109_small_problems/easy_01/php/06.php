<?php
function reverse_words($sentence) {
    $words = explode(" ", $sentence);
    $words = array_map(function($word) {
        if (strlen($word) >= 5) {
            return strrev($word);
        }
        return $word;
    }, $words);
    return implode(" ", $words);
}

$args = ['Professional', 'Walk around the block', 'Launch School'];

foreach($args as $arg) {
    echo reverse_words($arg)."\n";
}
?>
