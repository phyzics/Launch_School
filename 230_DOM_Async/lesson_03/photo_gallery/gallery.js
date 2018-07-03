$(function () {
  var $slideshow = $('#slideshow');
  var $nav = $slideshow.find('ul');

  $nav.on('click', 'a', function (e) {
    var $li;
    var index;

    e.preventDefault();

    $li = $(e.currentTarget).closest('li');
    index = $li.index();

    $li.addClass('current_photo');
    $li.siblings().removeClass('current_photo');

    $('figure').stop().filter(':visible').fadeOut(300, function () {
      $('figure').eq(index).fadeIn(300);
    });
  });
});
