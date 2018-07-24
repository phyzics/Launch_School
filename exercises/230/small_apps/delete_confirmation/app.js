$(() => {
  const $t = $('#todosTemplate').remove();
  const Todos = {
    items: [{id: 1, title: 'Homework'},
            {id: 2, title: 'Shopping'},
            {id: 3, title: 'Calling Mom'},
            {id: 4, title: 'Coffee with John'}],

    getTodo (id) {
      return this.items.filter(todo => todo.id === Number(id))[0];
    },

    removeTodo (id) {
      const todo = this.getTodo(id);
      const index = this.items.indexOf(todo);

      this.items.splice(index, 1);
    },
  };

  const UI = {
    template: Handlebars.compile($t.html()),
    $modal: $('#modal'),
    $overlay: $('#overlay'),

    clearDeletePrompt () {
      this.$modal.hide();
      this.$overlay.hide();
    },

    displayDeletePrompt () {
      $('#overlay').show();
      $('#modal').show();
    },

    removeTodo (id) {
      $(`li[data-id="${id}"]`).remove();
      this.clearDeletePrompt();
    },

    init () {
      $('main').append(this.template({ items: Todos.items }));
    },
  };

  const Application = {
    $modal: $('#modal'),

    setDataId (e) {
      const dataId = $(e.target).parent().attr('data-id');

      this.$modal.attr('data-id', dataId);
    },

    deletePrompt (e) {
      this.setDataId(e);
      UI.displayDeletePrompt();
    },

    deny (e) {
      e.preventDefault();

      UI.clearDeletePrompt();
    },

    confirm (e) {
      e.preventDefault();

      const id = this.$modal.attr('data-id');

      Todos.removeTodo(id);
      UI.removeTodo(id)
    },

    bindEvents () {
      $('main').on('click', 'span.delete', this.deletePrompt.bind(this));
      $('a.confirm').on('click', this.confirm.bind(this));
      $('main').on('click', 'a.deny, #overlay', this.deny.bind(this));
    },

    init () {
      UI.init();
      this.bindEvents();
    },
  };

  Application.init();
});
