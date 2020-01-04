<?php
define("METER_TO_FEET", 10.7639);
echo "Enter the length of the room in meters: ";
$line = fgets(STDIN);
$l = (float)$line;
echo "Enter the width of the room in meters: ";
$line = fgets(STDIN);
$w = (float)$line;
$sq_meters = $l * $w;
$sq_feet = $sq_meters * METER_TO_FEET;
printf("The area of the room is %.2f square meters (%.2f square feet).", $sq_meters, $sq_feet);
?>
