// easy_103.js - how Big is the Room
var SQMETER_TO_SQFT = 10.7639;
var length = Number(prompt('Enter the length of the room in meters:'));
var width = Number(prompt('Enter the width of the room in meters:'));
var sqmeter = length * width;
var sqft =  SQMETER_TO_SQFT * sqmeter;

console.log('The area of the room is ' + sqmeter.toFixed(2) + ' square meters ('
            + sqft.toFixed(2) + ' square feet).');
