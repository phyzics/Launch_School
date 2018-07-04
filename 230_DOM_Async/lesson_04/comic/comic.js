$(function () {
  function animateStrip() {
    $blinds.each(function (i) {
      var $blind = $blinds.eq(i);
      var currentDelay = delayTime * i;

      $blind.delay(currentDelay + 250).animate({
        top: '+=' + $blind.height(),
        height: 0
      }, speed);
    });
  }

  var $blinds = $('[id^=blind]');
  var speed = 250;
  var delayTime = 1500;

  $('p a').on('click', function (e) {
    e.preventDefault();

    $blinds.finish();
    $blinds.removeAttr('style');
    animateStrip();
  });

  animateStrip();
});
