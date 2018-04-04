// basics_04.js - String Assignment
var name = 'Bob';
var saveName = name;
name.toUpperCase();
console.log(name, saveName);

// it logs `Bob Bob` because `toUpperCase();` does not mutate the caller
// ^ this is incorrect -- it is because strings are immutable
