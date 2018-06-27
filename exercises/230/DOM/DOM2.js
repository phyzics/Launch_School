// DOM2.js - Child Nodes
/*
  id1 has 21 child nodes (9 direct, 12 indirect)

  id2 has 3 child nodes (2 direct, 1 indirect)

  id3 has 1 child node (1 direct)

  id4 has 4 child nodes (3 direct, 1 indirect)

  id5 has 1 child node (1 direct)

  id6 has 2 child nodes (1 direct, 1 indirect)

  id7 has 1 child node (1 direct)

  id8 has 3 child nodes (1 direct, 2 indirect)

  id9 has 2 child nodes (1 direct, 1 indirect)

  id10 has 1 child node (1 direct)
*/
function childNodes(id) {
  var element = document.getElementById(String(id));
  var directChildren = Array.prototype.slice.call(element.childNodes);
  var indirectChildrenCount = 0;

  (function countChildren(nodes) {
    nodes.forEach(function (node) {
      indirectChildrenCount += node.childNodes.length;

      if (node.childNodes.length > 0) {
        countChildren(Array.prototype.slice.call(node.childNodes));
      }
    });
  }(directChildren));


  return [directChildren.length, indirectChildrenCount]
}

console.log(childNodes(1));
console.log(childNodes(4));
console.log(childNodes(9));
