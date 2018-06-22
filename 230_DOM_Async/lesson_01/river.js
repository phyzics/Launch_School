function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

var html = document.childNodes[1];
var body = html.lastChild;
var heading = body.childNodes[1];
var pCount = 0;
var firstWords = [];
var paragraphNodes = [];

heading.style.color = 'red';
heading.style.fontSize = '48px';

walk(document.body, function (node) {
  if (node.tagName === 'P') {
    pCount += 1;
  }
});

console.log(pCount);

walk(document.body, function (node) {
  if (node.tagName === 'P') {
    var words = node.firstChild.data.trim().split(' ');
    firstWords.push(words[0]);
  }
});

console.log(firstWords);

walk(document.body, function (node) {
  if (node.nodeName === 'P') {
    paragraphNodes.push(node);
  }
});

paragraphNodes.forEach(function (node, idx) {
  if (idx !== 0) {
    node.className = 'stanza';
  }
});
