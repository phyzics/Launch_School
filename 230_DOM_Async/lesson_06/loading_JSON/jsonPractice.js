document.addEventListener('DOMContentLoaded', function () {
  var request = new XMLHttpRequest();

  request.open('GET', 'https://api.github.com/repos/rails/rails');
  request.responseType = 'json';

  request.addEventListener('load', function (event) {
    var data = request.response;

    console.log(request.status);
    console.log(data.open_issues);
  });

  request.addEventListener('error', function (event) {
    console.log('The request could not be completed!');
  });

  request.send();
})
