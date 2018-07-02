$(function () {
  function addItem(name, quantity) {
    $('ul').append('<li>' + quantity + ' ' + name + '</li>');
  }

  $('form').on('submit', function (e) {
    var name;
    var qty;
    var $form;

    e.preventDefault();

    $form = $(this);
    name = $('#name').val();
    qty = $('#quantity').val().trim() || '1';

    addItem(name, qty);
    $form.get(0).reset();
  });
});
