$(() => {
  const $t = $('#todosTemplate').remove();
  const Todos = {
    items: [{id: 1, title: 'Homework'},
            {id: 2, title: 'Shopping'},
            {id: 3, title: 'Calling Mom'}],

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
    $contextMenu: $('#contextMenu'),

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

    hideContextMenu () {
      if (this.$contextMenu.css('display') === 'block') {
        this.$contextMenu.hide();
      }
    },

    displayContextMenu (x, y) {
      this.hideContextMenu();
      this.$contextMenu.css({
        display: 'absolute',
        top: `${y}px`,
        left: `${x}px`
      });
      this.$contextMenu.fadeIn();
    },

    init () {
      $('main').append(this.template({ items: Todos.items }));
    },
  };

  const Application = {
    $modal: $('#modal'),
    $main: $('main'),

    setDataId ($target, $element) {
      const dataId = $($target).attr('data-id');

      $element.attr('data-id', dataId);
    },

    deletePrompt (e) {
      this.setDataId($(e.target).parent(), this.$modal);
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

    setContextMenu (e) {
      e.preventDefault();

      const x = e.clientX;
      const y = e.clientY;

      this.setDataId($(e.target), $('#contextMenu'));
      UI.displayContextMenu(x, y);
    },

    bindEvents () {
      this.$main.on('contextmenu', 'li', this.setContextMenu.bind(this));
      $('#delete').on('click', this.deletePrompt.bind(this));
      $('body').on('click', UI.hideContextMenu.bind(UI));
      $('a.confirm').on('click', this.confirm.bind(this));
      this.$main.on('click', 'a.deny, #overlay', this.deny.bind(this));
    },

    init () {
      UI.init();
      this.bindEvents();
    },
  };

  Application.init();
});
