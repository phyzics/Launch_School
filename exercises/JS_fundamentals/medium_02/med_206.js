// med_206.js - Length
var languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages);  // ["JavaScript", "Ruby", "Python"]
console.log(languages.length);  // 3

languages.length = 4;
console.log(languages);  // ["JavaScript", "Ruby", "Python", empty]
console.log(languages.length);  // 4

languages.length = 1;
console.log(languages); // ["JavaScript"]
console.log(languages.length);  // 1

languages.length = 3;
console.log(languages);  // ["JavaScript", empty x 2]
console.log(languages.length);  // 3

languages.length = 1;
languages[2] = 'Python';
console.log(languages);  // ["JavaScript", empty, "Python"]
console.log(languages[1]);  // undefined
console.log(languages.length);  // 3

/*
  The first couple of logged as expected: the first is the array, the second
  is the number `3` since there are 3 elements in the array.

  On line 7 we log the array again with `empty` at index 3 since there is no
  element assigned to it. This happened because we changed the `length` property
  of `languages` on line 6 to `4` from `3`, and so JavaScript added the index
  with no value assigned to it. Hence why on line 8 when we get the `length`
  property of `languages` it returns `4`.

  We set the `length` property of `languages` to `1` on line 10, which removes
  all of the indexes and their values except for index `0`. Hence when we log
  `langauges` on line 11, only the element `"JavaScript"` is present in the array.
  This is also why the `length` of `languages` is now `1` when logged on line 12.

  We set the `length` property of `languages` to `3` on line 14, creating two new
  indexes which are empty. This explains the value logged on line `15`, as well
  as why the `length` property is now `3` as logged on line 16.

  Lastly, we set the `length` property back to `1` again on line 18. On line
  19 we set index `2` to `'Python'`, which causes JavaScript to also create index
  `1` which is empty, hence the value logged on line 20. When we try and access
  the empty index on line 21, it returns `undefined` since it was never set to a
  value. Lastly, since empty indexes are still counted as part of an array's length,
  the length property is `3` when logged on line 22.
*/
