var me = {
  firstName: 'Jane',
  lastName: 'Doe',
  index: 0,
};

var friend = {
  firstName: 'John',
  lastName: 'Smith',
  index: 1,
};

var mother = {
  firstName: 'Amber',
  lastName: 'Doe',
  index: 2,
};

var father = {
  firstName: 'Shane',
  lastName: 'Doe',
  index: 3,
};

var people = {
  collection: [me, friend, mother, father],
  lastIndex: 4,
  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  rollCall: function() {
    this.collection.forEach(this.fullName);
    this.collection.forEach(function (person) {
      console.log(person.index);
    });
  },

  add: function(person) {
    if (this.isInvalidPerson(person)) return;

    person.index = this.lastIndex;
    this.collection.push(person);
    this.lastIndex += 1;
  },

  getIndex: function(person) {
    var index = -1;
    this.collection.forEach(function(comparator, i) {
      if (comparator.firstName === person.firstName &&
          comparator.lastName === person.lastName) {
        index = i;
      }
    });

    return index;
  },

  remove: function(person) {
    var index;

    if (!this.isInvalidPerson(person)) return;

    index = this.getIndex(person);
    if (index === -1) return;

    this.collection.splice(index, 1);
  },

  isInvalidPerson: function(person) {
    return typeof person.firstName !== 'string' &&
           typeof person.lastName !== 'string';
  },

  get: function(person) {
    if(this.isInvalidPerson(person)) return;

    return this.collection[this.getIndex(person)];
  },

  update: function(person) {
    if (this.isInvalidPerson(person)) return;

    var exisitingPersonId = this.getIndex(person);
    if (exisitingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[exisitingPersonId] = person;
    }
  },
};

var doppleganger = {
  firstName: 'Jane',
  lastName: 'Doe',
}

var papaganger = {
  firstName: 'Shane',
  lastName: 'Doe',
}

people.add(doppleganger);
people.add(papaganger);
people.rollCall();
