var divs = document.getElementsByClassName('intro');
var divsArr = Array.prototype.slice.call(divs);
var paragraphs = [];

divsArr.forEach(function (div) {
  var p = div.getElementsByTagName('p');
  var i;

  for (i = 0; i < p.length; i += 1) {
    p[i].classList.add('article-text');
  }
});
