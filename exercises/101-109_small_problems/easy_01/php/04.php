<?php
function count_occurences($array) {
    $map = [];
    foreach ($array as $key) {
        if (array_key_exists($key, $map)) {
            $map[$key] += 1;
        } else {
            $map[$key] = 1;
        }
    }
    return $map;
}

$vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
];

print_r(count_occurences($vehicles));
?>
