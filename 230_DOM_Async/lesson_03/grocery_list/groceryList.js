$(function () {
  var $form = $('form');

  $form.on('submit', function (e) {
    var name;
    var qty;
    var li;

    e.preventDefault();

    name = $('#name').val();
    qty = $('#quantity').val().trim() || '1';
    li = document.createElement('li');
    li.textValue = qty + ' ' + name;

    $('ul').append('<li>' + qty + ' ' + name + '</li>');
  });
});
