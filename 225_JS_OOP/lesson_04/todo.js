// todo.js
function makeList() {
  var list = [];
  return function(item) {
    var idx;

    if (arguments.length === 0) {
      if (list.length === 0) {
        console.log('The list is empty.');
      } else {
        list.forEach(function(item) { console.log(item); });
      }
    } else if (!list.includes(item)) {
      list.push(item);
      console.log(item + ' added!')
    } else if (list.includes(item)) {
      idx = list.indexOf(item);
      list.splice(idx, 1);
      console.log(item + ' removed!')
    }
  }
}

var list = makeList();
list();
list('make breakfast');
list('read book');
list();
list('make breakfast');
list();
