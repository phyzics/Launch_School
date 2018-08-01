const AppView = Backbone.View.extend({
  el: 'body',
  template: Handlebars.templates.app,
  newPersonTemplate: Handlebars.templates.newPerson,
  events: {
    'click #add-person': 'renderNewPersonModal',
    'submit': 'savePerson',
    'click .btn-cancel': 'closeModal'
  },

  savePerson (e) {
    e.preventDefault();

    const $form = this.$('form');
    const personData = {
      name: $form.find('#name').val(),
      colors: [$form.find('#color1').val(), $form.find('#color2').val(), $form.find('#color3').val()],
    };

    App.list.add(personData);
    this.closeModal();
  },

  closeModal (e) {
    this.$('#new-person-modal').remove();
  },

  render () {
    this.$el.html(this.template());
  },

  renderNewPersonModal () {
    this.$el.append(this.newPersonTemplate());
  },
});
