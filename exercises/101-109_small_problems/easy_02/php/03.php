<?php
echo "What is the bill? ";
$bill = (int)fgets(STDIN);
echo "What is the tip percentage? ";
$tip_input = (int)fgets(STDIN);
$tip = $tip_input / 100.00;
$tip_total = $bill * $tip;
$total = $bill + $tip_total;
printf("The tip is $%.2f\n", $tip_total);
printf("The total is $%.2f\n", $total);
?>
