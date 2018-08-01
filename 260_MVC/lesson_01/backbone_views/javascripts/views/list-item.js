const ListItemView = Backbone.View.extend({
  tagName: 'li',
  template: Handlebars.templates.listItems,
  render () {
    this.$el.html(this.template(this.model.toJSON()));

    return this.el;
  },
});
