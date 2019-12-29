<?php
function repeat($str, $times) {
    for ($i=0; $i < $times; $i++) {
        echo "$str\n";
    }
}

repeat('Hello', 3);
?>
