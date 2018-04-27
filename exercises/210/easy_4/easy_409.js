// easy_409.js - How Many
function countOccurrences(array) {
  var count = {};
  var i;
  var item;

  for (i = 0; i < array.length; i += 1) {
    count[array[i]] = count[array[i]] || 0;
    count[array[i]] += 1;
  }

  for (item in count) {
    console.log(item + ' => ' + count[item]);
  }
}

var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);
/*
  PEDAC
  utp:
    - count occurances of each ele in an array
    - log 'ele => num'
  data:
    - i: array
    - o: string
  alg:
    - create an object {}
    - iterate over the array
      - if exists += 1; o/w = 1
    - iterate over the object
      - log result
*/
