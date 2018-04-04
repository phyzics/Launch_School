// basics_06.js - Counting the Number of Characters
var phrase = prompt('Please enter a phrase: ');
var numberOfCharacters = String(phrase.length);

console.log("There are " + numberOfCharacters + " characters in " + phrase + ".");

// further exploration
var input = prompt('Please enter a phrase: ');
var phrase = input.replace(/([^a-z])/gi, '');
var numberOfCharacters = phrase.length;

console.log(`There are ${numberOfCharacters} characters in ${input}.`);
