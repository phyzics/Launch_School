$(function () {
  function createShape(submitData) {
    var $shape = $('<div></div>');

    $shape.addClass(submitData[0].value);
    $shape.data('startX', submitData[1].value || '0');
    $shape.data('startY', submitData[2].value || '0');
    $shape.data('endX', submitData[3].value || '0');
    $shape.data('endY', submitData[4].value || '0');

    $shape.css({
      top: $shape.data('startX') + 'px',
      left: $shape.data('startY') + 'px'
    });

    return $shape;
  }

  function resetPosition($shape) {
    $shape.stop();
    $shape.css({
      top: $shape.data('startX') + 'px',
      left: $shape.data('startY') + 'px'
    });
  }

  function animateShape($shape) {
    resetPosition($shape);
    
    $shape.animate({
      top: $shape.data('endX') + 'px',
      left: $shape.data('endY') + 'px'
    }, 1000);
  }

  $form = $('form');
  $startAnimationLink = $('main p a').eq(0);
  $endAnimationLink = $('main p a').eq(-1);

  $form.on('submit', function (e) {
    var shape;

    e.preventDefault();

    $shape = createShape($form.serializeArray());
    $('#canvas').append($shape);
  });

  $startAnimationLink.on('click', function (e) {
    var $animations;

    e.preventDefault();

    $animations = $('#canvas div');

    $animations.each(function (i) {
      animateShape($animations.eq(i));
    });
  });

  $endAnimationLink.on('click', function (e) {
    e.preventDefault();

    $('#canvas div').stop();
  })

});
