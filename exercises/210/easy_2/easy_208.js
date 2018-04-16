// easy_208.js - Grade Book
function getGrade(score1, score2, score3) {
  var total = score1 + score2 + score3;
  var average = total / 3;
  var grade;

  if (average >= 90) {
    grade = 'A';
  } else if (average >= 80) {
    grade = 'B';
  } else if (average >= 70) {
    grade = 'C';
  } else if (average >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  return grade;
}

/*
  PEDAC
  utp:
    - get the mean of three scores and return the letter grade
  data:
    - i: numbers
    - o: string
    - data: numbers, strings
  ec:
    - incorrect data types
    - negative grades or grdes above 100 (don't have to check)
  alg:
    - sum the grades, divide by 3, then put through conditionals
/*
