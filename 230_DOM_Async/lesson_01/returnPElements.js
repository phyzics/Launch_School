function walk(node, callback) {
  var i;

  callback(node);

  for (i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}

function getParagraphNodes() {
  var paragraphs = [];

  walk(document.body, function (node) {
    if (node.nodeName === 'P') {
      paragraphs.push(node);
    }
  });

  return paragraphs;
}

// Launch School's Solution
function findAllParagraphs() {
  var matches = [];
  var nodes = document.body.childNodes;

  for (var i = 0; i < nodes.length; ++i) {
    if (nodes[i] instanceof HTMLParagraphElement) {
      matches.push(nodes[i]);
    }
  }

  return matches;
}

console.log(findAllParagraphs());
