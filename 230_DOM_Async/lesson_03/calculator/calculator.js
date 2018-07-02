function performCalculation(n1, n2, op) {
  switch (op) {
    case '+':
      return n1 + n2;
      break;
    case '-':
      return n1 - n2;
      break;
    case '*':
      return n1 * n2;
      break;
    case '/':
      return n1 / n2;
  }
}

$(function () {
  $('form').on('submit', function (e) {
    var numA;
    var numB;
    var operator;
    var answer;

    e.preventDefault();

    numA = Number($('#numerator').val());
    numB = Number($('#denominator').val());
    operator = $('#operator').val();
    answer = performCalculation(numA, numB, operator);

    $('h1').text(String(answer));
  });
});
