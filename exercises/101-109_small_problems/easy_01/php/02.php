<?php
function is_odd($num) {
    if ($num % 2 === 0) {
        return false;
    }
    return true;
}

$args = [2, 5, -17, -8, 0, 7];
for ($i=0; $i < count($args); $i++) {
    $num = $args[$i];
    if (is_odd($num)) {
        echo "true\n";
    } else {
        echo "false\n";
    }
}
?>
