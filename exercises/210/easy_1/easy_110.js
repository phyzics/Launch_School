// easy_110.js - ASCII String Value
function asciiValue(string) {
  var sum = 0;
  var i;

  if (typeof string !== 'string') {
    return 'ERROR: Input data type must be a string!';
  }

  string = string.trim();

  for (i = 0; i < string.length; i++) {
    sum += string.charCodeAt(i);
  }

  return sum;
}

/*
  PEDAC
  utp:
    - return the sum of the ASCII number of all the characters of a string
  data:
    - i: string
    - o: number
    - data types: string, number
  ec:
    - empty string (return 0)
    - incorrect data type (reject)
    - leading/following white spaces (trim input)
  alg:
    - set up a variable
    - loop through the string
    - convert each char and add its value to the variable
    - return the variable
*/
