$(() => {
  const $body = $('body');
  let id;

  $body.on('mouseenter', 'figure', (e) => {
    const $figure = $(e.currentTarget);

    id = setTimeout(() => {
      $figure.find('figcaption').fadeIn();
    }, 2000)
  });

  $body.on('mouseleave', 'figure', (e) => {
    const $figure = $(e.currentTarget);

    clearTimeout(id);
    $figure.find('figcaption').fadeOut();
  })
});
