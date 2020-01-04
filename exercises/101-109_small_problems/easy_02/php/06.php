<?php
$nums = range(1, 99);
foreach($nums as $num) {
    if ($num % 2 != 0) {
        echo "$num\n";
    }
}
?>
