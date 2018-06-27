// DOM5.js - Coloring
/* PEDAC

P:
  - function that colors a specific generation of DOM tree
    - generation: elements on the same level of identation
    - can use the `.generat-color` class to color the specific generation
    - can assume only non-negative ints as arguments

A:
  1) keep track of the current level
    - have a tracker variable initialized to 1
    - this increments each time we have to go another level
  2) get the children of the next level
  3) color the children of the correct level
    - walk the tree starting at document.body
      - initial level set to 1
      - each time we walk we:
        - see if `n` is equal to the currentLevel
          - if it is, we color the elements
          - if not, we increment currentLevel and continue to walk

*/
document.addEventListener('DOMContentLoaded', function () {
  function walk(node, callback) {
    var children = node.children;
    var i;

    callback(node);

    for (i = 0; i < children.length; i += 1) {
      walk(children[i], callback);
    }

    currentLevel -= 1;
  }

  function colorGeneration(n) {
    currentLevel = 1;

    walk(document.body, function (node) {
      var childrenArr = Array.prototype.slice.call(node.children);

      if (currentLevel === n) {
        childrenArr.forEach(function (child) {
          child.classList.add('generation-color');
        });

        currentLevel += 1;
      } else {
        currentLevel += 1;
      }
    });
  }

  var currentLevel;

  colorGeneration(3);
});

// Launch School's Solution
function colorGeneration(targetGeneration) {
  var generation = 0;
  var parents = [document.body];
  var elements;

  while (generation < targetGeneration) {
    generation += 1;
    elements = getAllChildrenOf(parents);
    parents = elements;
  }

  if (elements) {
    color(elements);
  }
}

function color(elements) {
  elements.forEach(function (element) {
    element.classList.add('generation-color');
  });
}

function getAllChildrenOf(parents) {
  return parents.map(function (element) {
    return Array.prototype.slice.call(element.children);
  }).reduce(function (collection, children) {
    return collection.concat(children);
  }, []);
}
