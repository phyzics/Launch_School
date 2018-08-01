// User model
const User = Backbone.Model.extend({
  url: 'http://jsonplaceholder.typicode.com/users'
});
const Users = Backbone.Collections.extend({
  model: User,
  url: 'http://jsonplaceholder.typicode.com/users',
  parse (response) {
    response.forEach(user => {
      user.companyName = user.company.name;
      user.catchPhrase = user.company.catchPhrase;
      user.companyBs = user.company.bs;
    });

    return response;
  },
  initialize () {
    this.on('sync sort', () => {$('main').append(Templates.users({ users: this.toJSON() }))};
  }
});

const blogWriters = new Users.fetch({
  success () {
    console.log(blogWriters.toJSON);
  }
});

const writer = blogWriters.create({
  name: 'Nick Calibey',
  email: 'nick.calibey@gmail.com'
}, {
  success () {
    console.log(blogWriters.toJSON());
  }
});

blogWriters.fetch({
  reset: true,
  success () {
    console.log(blogWriters.toJSON());
  }
});

blogWriters.set({
  id: 1,
  name: 'Nick Calibey',
  email: 'nick.calibey@gmail.com'
});

blogWriters.comparator = 'name';
blogWriters.sort();

console.log(blogWriters.pluck('email'));
