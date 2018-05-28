// medium_207.js - Bubble Sort
/* Algorithm
  1) define a sort function helper
    if else where a > b 1, a = b 0, a < b -1
  2) bubble sort
    - set up a variable that tracks whether a swap was made or not (boolean)
      - initialize to false
    - loop over the array
      - if 1, then set boolean to true, splice the latter element and insert it
      - if 0 or -1, then nothing
      - at the end of iteration, if boolean is true, then set it back to false
        - otherwise break

  var array = [5, 3];
  bubbleSort(array);
  console.log(array);    // [3, 5]

  var array = [6, 2, 7, 1, 4];
  bubbleSort(array);
  console.log(array);    // [1, 2, 4, 6, 7]

  var array = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
  bubbleSort(array);
  console.log(array);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
*/
function bubbleSort(arr) {
  var swap;
  var currentElement;
  var nextElement;
  var spliced;
  var i;

  do {
    swap = false;

    for (i = 0; i < arr.length - 1; i += 1) {
      currentElement = arr[i];
      nextElement = arr[i + 1];

      if (currentElement > nextElement) {
        spliced = arr.splice(i + 1, 1)[0];
        arr.splice(i, 0, spliced);
        swap = true;
      }
    }
  } while (swap);
}

var array = [5, 3];
bubbleSort(array);
console.log(array);

var array = [6, 2, 7, 1, 4];
bubbleSort(array);
console.log(array);    // [1, 2, 4, 6, 7]

var array = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array);
console.log(array);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
