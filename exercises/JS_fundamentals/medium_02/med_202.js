// med_202.js - Equal
var person = { name: 'Victor' };
var otherPerson = { name: 'Victor' };

console.log(person === otherPerson);
// this logs `false` because the strict equality operator checks if the operands
// are the same object, *not* if they have the same value. In that case, do:

console.log(person.name === otherPerson.name);

// Or, as LS points out, set `otherPerson` to the same object
otherPerson = person;
console.log(person === otherPerson);
