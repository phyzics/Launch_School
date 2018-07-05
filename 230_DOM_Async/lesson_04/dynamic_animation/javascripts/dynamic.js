$(function () {
  function getFormObject($f) {
    var obj = {};

    $f.serializeArray().forEach(function (input) {
      obj[input.name] = input.value;
    });

    return obj;
  }

  function createShape(data) {
    var $shape = $('<div />', {
      'class': data.shapeType,
      data: data
    });

    resetPosition($shape);

    return $shape;
  }

  function resetPosition($shape) {
    $shape.stop();
    $shape.css({
      top: Number($shape.data('startX')),
      left: Number($shape.data('startY'))
    });
  }

  function animateShape() {
    var $shape = $(this);

    resetPosition($shape);

    $shape.animate({
      top: Number($shape.data('endX')),
      left: Number($shape.data('endY'))
    }, 1000);
  }

  function stopAnimations() {
    $('#canvas div').stop();
  }

  $form = $('form');
  $startAnimationLink = $('main p a').eq(0);
  $endAnimationLink = $('main p a').eq(-1);

  $form.on('submit', function (e) {
    var shape;
    var data;

    e.preventDefault();

    data = getFormObject($form);
    $shape = createShape(data);
    $('#canvas').append($shape);
  });

  $startAnimationLink.on('click', function (e) {
    e.preventDefault();

    $('#canvas div').each(animateShape);
  });

  $endAnimationLink.on('click', function (e) {
    e.preventDefault();

    stopAnimations();
  })

});
