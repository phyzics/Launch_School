<?php
function calculate_bonus($salary, $bonus) {
    if ($bonus) {
        return $salary / 2;
    }
    return $salary;
}

$args = [[2800, true], [1000, false], [50000, true]];

foreach ($args as $arg) {
    echo calculate_bonus($arg[0], $arg[1])."\n";
}
?>
