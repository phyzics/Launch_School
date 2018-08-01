function renderPost(model) {
  const postTemplate = $('#post').html();
  const $post = $(postTemplate);

  $post.find('h1').text(model.get('title'));
  $post.find('header p').text(`By ${model.get('user').get('name')}`);
  $post.find('header + p').text(model.get('body'));
  $(document).html($post);
}

const PostModel = Backbone.Model.extend({
  urlRoot: 'http://jsonplaceholder.typicode.com/posts',
  setUser () {
    const self = this;
    const user = new UserModel({ id: self.get('userId')});

    user.fetch({
      success (model) {
        self.set('user', model);
      }
    });
  }

  initialize () {
    if (this.has('userId')) this.setUser();
    this.on('change:userId', this.setUser);
    this.on('change', renderPost);
  },
});

const post = new PostModel({ id: 1 });
const post2 = new PostModel({
  id: 2,
  title: 'Another post!',
  body: 'This is the body',
  userId: 2,
});

post2.set('title', 'An addendum');
