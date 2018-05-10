// compareVersions.js
function invalidVersionFormat(version) {
  return !/^\d+(\.\d+)*$/.test(version);
}

function padSmallerArray(arr1, arr2) {
  var arr1len = arr1.length;
  var arr2len = arr2.length;
  var diff = Math.abs(arr1len - arr2len);
  var i;

  if (arr1.length > arr2.length) {
    for (i = 0; i < diff; i += 1) {
      arr2.push(0);
    }
  } else if (arr1.length < arr2.length) {
    for (i = 0; i < diff; i += 1) {
      arr1.push(0);
    }
  }
}

function convertVersionToNumbers(version) {
  return version.split('.').map(Number);
}

function compareVersions(version1, version2) {
  if (invalidVersionFormat(version1) || invalidVersionFormat(version2)) {
    return null;
  }

  var v1numbers = convertVersionToNumbers(version1);
  var v2numbers = convertVersionToNumbers(version2);
  var i;

  padSmallerArray(v1numbers, v2numbers);

  for (i = 0; i < v1numbers.length; i += 1) {
    if (v1numbers[i] === v2numbers[i]) {
      continue;
    } else if (v1numbers[i] > v2numbers[i]) {
      return 1;
    } else if (v1numbers[i] < v2numbers[i]) {
      return -1;
    }
  }

  return 0;
}

console.log(compareVersions('0.1', '1') === -1);
console.log(compareVersions('1', '1.0') === 0);
console.log(compareVersions('1.1', '1.2') === -1);
console.log(compareVersions('1.2', '1.2.0.0') === 0);
console.log(compareVersions('1.2.0.0', '1.18.2') === -1);
console.log(compareVersions('1.18.2', '1.2.0.0') === 1);
console.log(compareVersions('1.18.2', '13.37') === -1);
console.log(compareVersions('1.18.2', '1a5.7!') === null);
console.log(compareVersions('.1', '1.0') === null);
console.log(compareVersions('1.', '1.0') === null);
console.log(compareVersions('1..0', '1.0') === null);
console.log(compareVersions('1.1', '.1') === null);

/*  PEDAC
P:
  - compare two version numbers
    - return 1 if a > b
    - return -1 if a < b
    - return 0 if a === b
  - if char has something other than '.' or numbers, return null
  Input: string
  Output: number

  How are the numbers compared?
    each section (sections being separated by '.') is compared as one would
    expect with numbers (hence why 1.2 < 1.18)
E:
  Edge Cases:
    - empty string?
    - incorrect data type?
  Tests:
    console.log(compareVersions('0.1', '1'));
    console.log(compareVersions('1', '1.0'));
    console.log(compareVersions('1.1', '1.2'));
    console.log(compareVersions('1.2', '1.2.0.0'));
    console.log(compareVersions('1.2.0.0', '1.18.2'));
    console.log(compareVersions('1.18.2', '13.37'));
    console.log(compareVersions('1.18.2', '1a5.7!'));

DA:
  Data Structure: array of numbers which are the separate components

  Algorithm:
    - edge guard with regex for the input
    - convert strings into array of numbers
      - split on '.', save to a variable
      - map the array, coercing strings to numbers
    - make sure array lengths are equal
      - populate the lesser array with `0`
        - set lengths of the arrays to variables
        - we loop `diff` of `len` times, push `0` into the smaller array
    - compare values from each array
      - use the logic in P for each comparison value, but skip if they are equal
      - if neither is greater at the end of iteration, return 0
*/
