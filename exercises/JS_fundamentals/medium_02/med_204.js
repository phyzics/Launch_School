// med_204.js - Caller
function makeDoubler(caller) {
  doubler = function (number) {
    console.log('This function was called by ' + caller + '.');
    return number + number;
  };

  return doubler;
}

// Launch School's solution
function makeDoubler(caller) {
  return function (number) {
    console.log('This function was called by ' + caller + '.');
    return number + number;
  };
}

var doubler = makeDoubler('Victor');
doubler(5);
