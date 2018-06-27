// DOM4.js - Tree Slicing
document.addEventListener('DOMContentLoaded', function () {
  function resetClasses() {
    var element;
    for (var i = 1; i <= 24; i += 1) {
      element = document.getElementById(String(i));

      if (element.hasAttribute('class')) {
        element.classList.remove('searching');
      }
    }
  }

  function walkElements(node, callback) {
    var i;
    var children = node.children;
    var elementFound = callback(node);

    if (elementFound) return true;

    for (i = 0; i < children.length; i += 1) {
      elementFound = walkElements(children[i], callback);

      if (elementFound) {
        return true;
      }
    }

    node.classList.remove('searching');
  }

  function sliceTree(startId, endId) {
    var endNodeFound = false;
    var startNode = document.getElementById(String(startId));
    var elements;
    var children;

    resetClasses();

    if (startNode === null || document.getElementById(String(endId)) === null) {
      return undefined;
    }

    walkElements(startNode, function (node) {
      node.classList.add('searching');

      if (Number(node.id) === endId) endNodeFound = true;

      return endNodeFound;
    });

    if (!endNodeFound) {
      return undefined;
    } else {
      elements = Array.prototype.slice.call(document.querySelectorAll('.searching'));
      return elements.map(function (node) {
        return node.nodeName;
      });
    }
  }

  console.log(sliceTree(1, 4));
  console.log(sliceTree(1, 76));
  console.log(sliceTree(2, 5));
  console.log(sliceTree(5, 4));
  console.log(sliceTree(1, 23));
  console.log(sliceTree(1, 22));
  console.log(sliceTree(11, 19));
});
