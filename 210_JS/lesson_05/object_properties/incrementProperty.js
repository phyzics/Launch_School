// incrementProperty.js
function incrementProperty(object, propertyName) {
  if (objectHasProperty(object, propertyName)) {
    object[propertyName] += 1;
  } else {
    object[propertyName] = 1;
  }

  return object[propertyName];
}

function objectHasProperty(object, string) {
  return Object.keys(object).indexOf(string) !== -1 ? true : false;
}
