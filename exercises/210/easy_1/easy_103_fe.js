// easy_103_fe.js - How Big is the Room Further Exploration
var SQMETER_TO_SQFT = 10.7639;
var sqFeet;
var sqMeters;
var mainMeasurement;
var convertedMeasurement;
var baseMeasurementType = prompt('Do you want your measurement in meters or feet?');
var convertedMeasurementType;
var length = Number(prompt('Enter the length of the room:'));
var width = Number(prompt('Enter the width of the room:'));

convertedMeasurementType = baseMeasurementType === 'feet' ? 'meters' : 'feet';


if (baseMeasurementType === 'feet') {
  sqFeet = length * width;
  mainMeasurement = sqFeet;
  sqMeters = sqFeet / SQMETER_TO_SQFT;
  convertedMeasurement = sqMeters;
} else if (baseMeasurementType === 'meters') {
  sqMeters = length * width;
  mainMeasurement = sqMeters;
  sqFeet = sqMeters * SQMETER_TO_SQFT;
  convertedMeasurement = sqFeet;
}

console.log('The area of the room is ' + mainMeasurement.toFixed(2) + ' square '
            + baseMeasurementType + ' (' + convertedMeasurement.toFixed(2) +
            ' square ' + convertedMeasurementType + ').');
