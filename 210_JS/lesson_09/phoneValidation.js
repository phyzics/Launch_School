function validatePhoneNumber(number) {
  var cleanedNumber;

  if (!/^1?[-. (]?\d{3}[-. )]{0,2}\d{3}[-. ]?\d{4}$/.test(number)) return '0000000000';

  cleanedNumber = number.replace(/[-. ()]/g, '');
  return cleanedNumber.length === 11 ? cleanedNumber.slice(1) : cleanedNumber;
}

console.log(validatePhoneNumber('(123) 456 7890'));
console.log(validatePhoneNumber('(123) 456.7890'));
console.log(validatePhoneNumber('(123) 456-7890'));
console.log(validatePhoneNumber('123 456 7890'));
console.log(validatePhoneNumber('123.456.7890'));
console.log(validatePhoneNumber('123-456-7890'));
console.log(validatePhoneNumber('1(123) 456 7890'));
console.log(validatePhoneNumber('1(123) 456.7890'));
console.log(validatePhoneNumber('1(123) 456-7890'));
console.log(validatePhoneNumber('1 123 456 7890'));
console.log(validatePhoneNumber('1.123.456.7890'));
console.log(validatePhoneNumber('1-123-456-7890'));
console.log(validatePhoneNumber('1234567890'));
console.log(validatePhoneNumber('11234567890'));
console.log(validatePhoneNumber('22234567890'));
console.log(validatePhoneNumber('123456'));
console.log(validatePhoneNumber('1%234#567f8900'));


/*
P:
  - can contain digits and space, dash, period, and ()
  - greater than 11, bye
  - less than 10, bye
  - if 11, if first digit isn't 1, then bye

  Input: string
  Output: string

Edge Cases/Tests:
  - incorrect data type
  - does the positioning of the parenthesis and dots/spaces matter?
    - yes

Alg:
  - return 10 `0` if invalid
  - Have a regex which tests the string and covers the above parameters
  - If it passes, replace the special characters with '', and return the new
    string, trim 1 by finding length, and using slice(1)
*/
