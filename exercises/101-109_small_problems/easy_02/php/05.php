<?php
echo "What is your name? ";
$name =  trim(fgets(STDIN));
if ($name[-1] === "!") {
    echo "HELLO ".strtoupper($name)." WHY ARE WE SCREAMING?\n";
} else {
    echo "Hello $name.\n";
}
?>
