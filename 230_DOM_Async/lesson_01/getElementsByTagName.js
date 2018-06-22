function walk(node, callback) {
  callback(node);

  for (var i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

function getElementsByTagName(tagName) {
  var elements = [];

  walk(document.body, function (node) {
    if (node.tagName === tagName) {
      elements.push(node);
    }
  });

  return elements;
}

var paragraphs = getElementsByTagName('P');
paragraphs.forEach(function (node) {
  node.classList.add('article-text');
});
