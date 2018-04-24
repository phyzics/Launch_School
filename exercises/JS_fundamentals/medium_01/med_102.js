// med_102.js - Conditional Loop
var i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

// No, it will not, because 0 % 3 === 0, and thus i will never increment -
// we will have an infinite loop
