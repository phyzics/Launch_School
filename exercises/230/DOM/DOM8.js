// DOM8.js - Array to Nodes
function arrayToNodes(array) {
  (function walkArray(array, previousParent) {
    var children = array[1];
    var element;
    var i;

    array.forEach(function (value, idx) {
      if (idx === 0) {
        element = document.createElement(value);
        previousParent.appendChild(element);
      }
    });

    for (i = 0; i < children.length; i += 1) {
      walkArray(children[i], element);
    }
  }(array, document.querySelector('html')));
};

// Launch School's Solution
function arrayToNodes(nodes) {
  var parent = document.createElement(nodes[0]);
  var children = nodes[1];
  var i;

  if (children.length === 0) {
    return parent;
  } else {
    for (i = 0; i < children.length; i += 1) {
      parent.appendChild(arrayToNodes(children[i]));
    }
  }

  return parent;
}
