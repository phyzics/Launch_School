<?php
echo "What is your age? ";
$age = (int)fgets(STDIN);
echo "At what age would you like to retire? ";
$retire_age = (int)fgets(STDIN);
$current_year = (int)date("Y");
$years_of_work = $retire_age - $age;
$retire_year = $current_year + $years_of_work;
echo "It's $current_year. You will retire in $retire_year.\n";
echo "You have only $years_of_work years of work to go!\n";
?>
