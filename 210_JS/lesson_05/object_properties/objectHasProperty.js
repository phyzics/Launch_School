// objectHasProperty.js
function objectHasProperty(object, string) {
  return Object.keys(object).indexOf(string) !== -1 ? true : false;
}

// Launch School's solution
function objectHasProperty(object, propertyName) {
  var keys = Object.keys(object);
  return keys.indexOf(propertyName) !== -1;
}
