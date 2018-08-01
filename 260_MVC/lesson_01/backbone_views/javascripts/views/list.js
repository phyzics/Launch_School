const ListView = Backbone.View.extend({
  el: '#favorites',
  render () {
    this.collection.each(this.renderOne.bind(this));
  },

  renderOne (model) {
    const listItemView = new ListItemView({ model: model });
    this.$el.append(listItemView.render());
  },

  initialize () {
    this.listenTo(this.collection, 'add', this.renderOne);
  },
});
