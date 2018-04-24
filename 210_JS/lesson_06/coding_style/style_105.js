function read(pages) {
  var i;
  var message;

  console.log ('You started reading.');
  for (i = 0; i < pages; i += 1) {
    message = 'You read page ' + String(i);
    console.log(message);
  }
}

read(400);
