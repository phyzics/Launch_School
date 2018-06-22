function addClassToParagraphs(node, addedClass) {
  var nodes = node.childNodes;
  var i;

  for (i = 0; i < nodes.length; i += 1) {
    if (nodes[i].nodeName === 'P') {
      nodes[i].classList.add(addedClass);
    } else {
      addClassToParagraphs(nodes[i], addedClass);
    }
  }
}

addClassToParagraphs(document.body, 'article-text');

// Launch School's Solution
// function addClassToParagraphs(node) {
//   if (node instanceof HTMLParagraphElement) {
//     node.classList.add('article-text');
//   }
//
//   var nodes = node.childNodes;
//   for (var i = 0; i < nodes.length; ++i) {
//     addClassToParagraphs(nodes[i]);
//   }
// }
//
// addClassToParagraphs(document.body);
