// DOM7.js - Nodes to Array
function nodesToArr() {
  var body = document.body;

  return (function getChildren(node) {
    var children = Array.prototype.slice.call(node.children);

    if (children.length === 0) {
      return [node.nodeName, []];
    } else {
      return [node.nodeName, children.map(function (child) {
        return getChildren(child);
      })];
    }
  }(body));
}
