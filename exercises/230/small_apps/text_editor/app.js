$(() => {
  const Application = {
    performAction (e, valueArg = null) {
      const action = $(e.target).attr('data-command');

      document.execCommand(action, true, valueArg);
    },

    createLink(url) {
      if (!url) return;

      document.execCommand('createLink', false, url);
    },

    toggleLink (e) {
      const selection = document.getSelection().toString();

      if (!selection) return;

      const url = prompt('Please enter the URL:');
      this.createLink(url);
    },

    bindEvents () {
      $('#buttons').on('click', 'button:not([data-command="createLink"])', this.performAction.bind(this));
      $('.fa-link').on('click', this.toggleLink.bind(this));
    },

    init () {
      this.bindEvents();
    }
  };

  Application.init();
});
