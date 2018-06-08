// ppPFA.js - Practice Problems: Partial Function Application
// 1-3)
function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  return function(a) {
    return subtract(a, n);
  }
}

function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b);
  }
}

function multiply(a, b) {
  return a * b;
}

var multiplyBy5 = makePartialFunc(multiply, 5);

console.log(multiplyBy5(100));

// 4) because the returned anonymous function from `makePartialFunc` encloses
//    both `func` and `b`

// 5)
var subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall() {
  return function(students) {
    return rollCall('Math', students);
  }
}

var mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
