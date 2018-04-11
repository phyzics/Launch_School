// student_grade.js
var score1 = prompt('Enter score 1:');
var score2 = prompt('Enter score 2:');
var score3 = prompt('Enter score 3:');
var average = (parseInt(score1, 10) + parseInt(score2, 10) + parseInt(score3, 10)) / 3;
var grade;

if (average >= 90) {
  grade = 'A';
} else if (average >= 70 && average < 90) {
  grade = 'B';
} else if (average >= 50 && average < 70) {
  grade = 'C';
} else {
  grade = 'F';
}

console.log(`Based on the average of your 3 socres your letter grade is "${grade}".`)
