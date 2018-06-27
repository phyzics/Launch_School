// DOM3.js - Tracing the DOM Tree
function domTreeTracer(id) {
  var elements = [];
  var startingElement = document.getElementById(String(id));

  (function getAllSiblings(currentElement) {
    var parent = currentElement.parentNode;
    var siblings = Array.prototype.slice.call(parent.children);

    if (currentElement.id === '1') {
      elements.push([currentElement.nodeName]);
      return;
    }

    siblings = siblings.map(function (node) {
      return node.nodeName;
    });

    elements.push(siblings);

    if (currentElement.id !== '1') {
      getAllSiblings(parent);
    }
  }(startingElement));

  return elements;
}

console.log(domTreeTracer(1));
console.log(domTreeTracer(2));
console.log(domTreeTracer(22));
