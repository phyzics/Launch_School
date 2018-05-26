// medium_201.js - Lettercase Percentage Ratio
/* PEDAC
Algorithm:
  1) have an object with keys set to 0;
  2) get the total length of the string
  3) use regex to match upper and lower, divide by total and save to property
  4) for the remaining, save 100.0 - upper - lower %s
  5) return the object
*/
function letterPercentages(string) {
  var percentages = {
    lowercase: 0,
    uppercase: 0,
    neither: 0,
  };
  var len = string.length;
  var lowers;
  var uppers;
  var type;

  lowers = string.match(/[a-z]/g);
  percentages.lowercase = lowers === null ? 0 : lowers.length / len * 100;

  uppers = string.match(/[A-Z]/g);
  percentages.uppercase = uppers === null ? 0 : uppers.length / len * 100;

  percentages.neither = 100 - percentages.lowercase - percentages.uppercase;

  for (var type in percentages) {
    percentages[type] = percentages[type].toFixed(2);
  }

  return percentages;
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
