// ppContextLoss.js - Practice Problems: Dealing with Context Loss
/*
1) 'undefined undefined is a undefined'
   - the problem is when we pass `turk.getDescription` as an argument to
     `logReturnVal()`, the context is lost and so the implicit context is the
     global object
*/

// 2)
var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

function logReturnVal(func, context) {
  var returnVal = func.call(context);
  console.log(returnVal);
}

logReturnVal(turk.getDescription, turk);

// 3)
var getTurkDescription = turk.getDescription.bind(turk);

/*
4) No because when we pass the anonymous function as an argument to `forEach`
   the implicit context will be the global object, and thus `this` will point
   towards the global object rather than the `TESgames` object
*/

// 5
var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    var self = this;
    this.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();

// 6

var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
    }, this);
  }
};

// 7) 0

// 8)
var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }

    increment.call(this);
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();
console.log('\n' + foo.a);

// 9)
var foo = {
  a: 0,
  incrementA: function() {
    var increment = function () {
      this.a += 1;
    }.bind(this);

    increment();
    increment();
    increment();
  },
};

foo.incrementA();
console.log('\n' + foo.a);
