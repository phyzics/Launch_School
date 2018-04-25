// easy_304.js
function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

/*
  PEDAC
  utp:
    - return true if str is palindrome, o/w return false
    - case matters
  data:
    - i: string
    - o: boolean
    - data: strings, booleans
  ec:
    - incorrect data type
    - empty string
    - case (it matters)
    - non-alpha-numerics
  alg:
    - split the string by individual charcters, reverse that array, join it
      back into a string, and then `===` with the argument
*/
