// copyProperties.js
function copyProperties(obj1, obj2) {
  var property;

  for (property in obj1) {
    obj2[property] = obj1[property];
  }

  return Object.keys(obj1).length;
}

// Launch School's solution
function copyProperties(source, destination) {
  var count = 0;
  var property;
  for (property in source) {
    destination[property] = source[property];
    count += 1;
  }

  return count;
}
