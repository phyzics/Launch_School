// Events02.js - Reverse Engineer
document.querySelector('html').addEventListener('click', function (event) {
  if (event.target.id !== 'container') {
    document.querySelector('#container').style = 'display: none';
  }
});

/*
  The above works if we assume that there are no elements nested within
  #container. If there are, then it will not work. Instead, use LS solution
  below.
*/

// Launch School's Solution
document.querySelector('html').addEventListener('click', function (event) {
  var container = document.querySelector('#container');

  if(!container.contains(event.target)) {
    container.style = 'display: none';
  }
});
