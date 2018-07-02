$(function () {
  var $body = $('body');
  var $headers = $('header');
  var $bodyHeader = $headers.eq(1);
  var $mainHeader = $headers.eq(0);
  var $figures = $('figure');
  var $imgMop = $figures.eq(1).find('img');
  var $imgBaby = $figures.eq(0).find('img');

  $bodyHeader.prepend($('main h1'));
  $body.prepend($bodyHeader);
  $('article').append($figures);
  $figures.eq(0).find('img').replaceWith($imgMop);
  $figures.eq(1).prepend($imgBaby);

});
