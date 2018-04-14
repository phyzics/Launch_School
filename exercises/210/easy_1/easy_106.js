// easy_106.js - Short Long Short
function shortLongShort(string1, string2) {
  var larger;
  var smaller;

  if (string1.length > string2.length) {
    larger = string1;
    smaller = string2;
  } else {
    larger = string2;
    smaller = string1;
  }

  return smaller + larger + smaller;
}

/*
  utp:
    - 2 str args, get longer, return s l s
    - assume diff lengths
  i/o:
    - both are str, data structure will be str
  ec:
    - empty string is counted as 0 length
  alg:
    - compare lengths with `length` and save to appropraite variables
    - return str
*/

// Launch School answer
function shortLongShort(string1, string2) {
  if (string1.length > string2.length) {
    return string2 + string1 + string2;
  } else {
    return string1 + string2 + string1;
  }
}
