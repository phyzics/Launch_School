$(function () {
  var $form = $('form');
  var keyCode;
  $form.on('submit', function (e) {
    var $key;

    e.preventDefault();
    $key = $('#key').val();
    keyCode = $key.charCodeAt(0);
  });

  $(document).off('keypress').on('keypress', function (e) {
    if (e.which !== keyCode) return;

    $('a').trigger('click');
  });

  $('a').on('click', function (e) {
    e.preventDefault();
    $('#accordion').slideToggle();
  })
});
