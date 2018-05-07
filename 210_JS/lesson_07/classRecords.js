// classRecords.js
function generateClassrecodSummary(scores) {
  var scoreData = Object.keys(scores).map(function (student) {
    return scores[student].scores;
  });

  var examData = scoreData.map(function (score) {
    return score.exams;
  });

  return {
    studentGrades: scoreData.map(function (scoreObj) {
      return getStudentScore(scoreObj);
    }),
    exams: getExamSummary(examData),
  };
}

function sumScores(scores) {
  return scores.reduce(function (acc, val) { return acc + val; });
}

function formatStudentScore(score) {
  var scoreString = String(score);
  if (score >= 93) {
    return scoreString + ' (A)';
  } else if (score >= 85) {
    return scoreString + ' (B)';
  } else if (score >= 77) {
    return scoreString + ' (C)';
  } else if (score >= 69) {
    return scoreString + ' (D)';
  } else if (score >= 60) {
    return scoreString + ' (E)';
  } else {
    return scoreString + ' (F)';
  }
}

function getStudentScore(scoreObj) {
  var examsScore = sumScores(scoreObj.exams) / scoreObj.exams.length;
  var exercisesScore = sumScores(scoreObj.exercises);
  var totalScore = Math.round(examsScore * 0.65 + exercisesScore * 0.35);
  return formatStudentScore(totalScore);
}

function transpose(array) {
  return array[0].map(function (col, columnIdx) {
    return array.map(function (row) {
      return row[columnIdx];
    });
  });
}

function sortScores(scores) {
  scores.sort(function (a, b) { return a - b; });
}

function formatAverageToOneDigit(average) {
  return Math.round(average * 10) / 10;
}

function getExamSummary(examData) {
  var examScores = transpose(examData);

  sortScores(examScores);

  return examScores.map(function (exam) {
    var max = exam[exam.length - 1];
    var min = exam[0];
    var avg = formatAverageToOneDigit(sumScores(exam) / exam.length);

    return {
      average: avg,
      minimum: min,
      maximum: max,
    };
  });
}

var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassrecodSummary(studentScores));
