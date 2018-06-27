// DOM6.js - Node Swap
function walk(node, callback) {
  var children = node.children;
  var i;

  callback(node);

  for (var i = 0; i < children.length; i += 1) {
    walk(children[i], callback);
  }
}

function isNestedNode(id1, id2) {
  var startingNode = document.getElementById(id1);
  var idFound = false;

  walk(startingNode, function (node) {
    if (Number(node.id) === id2) {
      idFound = true;
    }
  });

  return idFound;
}

function nodeSwap(id1, id2) {
  var nodeA = document.getElementById(id1);
  var nodeB = document.getElementById(id2);
  var nodeAClone;
  var nodeBClone;

  if (!nodeA || !nodeB) {
    return undefined;
  } else if (isNestedNode(id1, id2) || isNestedNode(id2, id1)) {
    return undefined;
  }

  nodeAClone = nodeA.cloneNode(true);
  nodeBClone = nodeB.cloneNode(true);

  nodeA.parentElement.replaceChild(nodeBClone, nodeA);
  nodeB.parentElement.replaceChild(nodeAClone, nodeB);

  return true;
}
