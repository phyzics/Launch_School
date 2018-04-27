// easy_406.js - Multiplicative Average
function showMultiplicativeAverage(numbers) {
  var product = numbers.reduce(function (acc, val) {
                                return acc * val;
                              });

  return (product / numbers.length).toFixed(3);
}

console.log(showMultiplicativeAverage([3, 5]));
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));
/*
  PEDAC
  utp:
    - take array of integers, * them together, divie by number of ele
    - return result as string rounded to 3 decimals
  data:
    - i: array of numbers
    - o: string
  ec:
    - empty array
    - 0
    - incorrect data as one element
  alg:
    - save length of array into a variable
    - reduce and divide by len
    - toFixed(3), then String(number)
*/
