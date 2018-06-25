// polarBear2.js - Practice Problems: Finding Nodes and Traversing Elements
// 1)
var h2Array = Array.prototype.slice.call(document.getElementsByTagName('H2'));
console.log(h2Array.map(function (h2) {
  var words = h2.textContent.split(' ');

  return words.length;
}));

// 2)
console.log(document.getElementById('toc'));
console.log(document.getElementsByClassName('toc')[0])
console.log(document.querySelector('#toc'));
console.log(document.querySelectorAll('div.toc')[0]);

// 3)
var aArray = Array.prototype.slice.call(document.querySelectorAll('.toc a'));
aArray.forEach(function (a, idx) {
  if (idx % 2 === 0) {
    a.style.color = 'green';
  }
});

// 4)
var captions = Array.prototype.slice.call(document.querySelectorAll('.thumbcaption'));
console.log(captions.map(function (caption) {
  return caption.textContent.trim();
}));

// 5)
var rows = document.querySelector('.biota').children[0].children;
var rowArray = Array.prototype.slice.call(rows);
var classification = {};

rowArray.forEach(function (row) {
  var childrenArray = Array.prototype.slice.call(row.children);
  var rank;
  var group;

  if (childrenArray.length === 2) {
    rank = childrenArray[0].textContent.slice(0, -1);
    group = childrenArray[1].textContent;
    classification[rank] = group;
  }
});

console.log(classification);
