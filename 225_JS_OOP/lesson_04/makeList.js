// makeList.js
function makeList() {
  var items = [];
  var index;

  return {
    add: function(item) {
      index = items.indexOf(item);
      if (index === -1) {
        items.push(item);
        console.log(item + ' added!');
      }
    },
    list: function() {
      if (items.length === 0) {
        console.log('The list is empty.')
      } else {
        items.forEach(function(item) { console.log(item); });
      }
    },
    clear: function() {
      items = [];
      console.log('all items deleted!');
    },
    remove: function(item) {
      index = items.indexOf(item);
      items.splice(index, 1);
      console.log(item + ' removed!');
    }
  }
}

var list = makeList();
list.add('peas');
list.list();
list.add('corn');
list.list();
list.remove('peas');
list.list();
