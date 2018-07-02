$(function () {
  var $teamMembers = $('#team li > a');

  $(document).on('keyup', function (e) {
    var keyCode = e.which;

    if (keyCode === 27) {
      $('.modal, .modal_layer').filter(':visible').fadeOut();
    }
  });

  $teamMembers.on('click', function (e) {
    e.preventDefault();

    var $element = $(this);
    var $top = $(window).scrollTop() + 50;
    var $modal = $element.nextAll('.modal');
    var $modalOverlay = $element.nextAll('.modal_layer');

    $modal.css('top', String($top) + 'px');
    $element.nextAll('div').fadeIn();

    $('.modal_layer, a.close').on('click', function (e) {
      e.preventDefault();

      $modal.fadeOut();
      $modalOverlay.fadeOut();
    });
  });
});
