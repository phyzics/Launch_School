function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

var imageCount = 0;
var pngCount = 0;

walk(document.body, function (node) {
  if (node.nodeName === 'IMG') {
    imageCount += 1;

    if (/\.png$/.test(node.src)) {
      pngCount += 1;
    }
  }
});

console.log(imageCount);
console.log(pngCount);

walk(document.body, function (node) {
  if (node.nodeName === 'A') {
    node.style.color = 'red';
  }
});
