$(() => {
  function formatName(name) {
    return name.split('_').map(word => word.slice(0, 1).toUpperCase() + word.slice(1)).join(' ');
  }

  function getErrorMessage(element) {
    switch (element.getAttribute('id')) {
      case 'phone_number':
        return ERROR_MSGS[2];
      case 'email':
        return ERROR_MSGS[1];
      case 'password':
        return ERROR_MSGS[3];
    }
  }

  function validateInput() {
    const target = this;
    const $span = $(target).next();
    const inputName = formatName(target.name);
    const valueMissing = target.validity.valueMissing;

    if (valueMissing && target.getAttribute('id') !== 'phone_number') {
      $(target).next().text(inputName + ERROR_MSGS[0]);
      $(target).addClass('error_message');
    } else if (!valueMissing) {
      if(target.validity.patternMismatch) {
        $span.text(getErrorMessage(target));
        $(target).addClass('error_message');
      }
    }
  }

  const $form = $('form');
  const $email = $('#email');
  const $password = $('#password');
  const $phoneNumber = $('#phone_number');
  const $p = $('p');
  const ERROR_MSGS = [
    ' is a required field.',
    'Please Enter a valid Email.',
    'Please Enter a valid Phone Number.',
    'Password must be at least 10 characters long.'
  ];

  $form.on('blur', 'input', validateInput);

  $form.on('focus', 'input', e => {
    const $target = $(e.target);

    if ($target.hasClass('error_message')) {
      $target.removeClass('error_message');
      $target.next().text('');
    }
  })

  $form.on('submit', e => {
    e.preventDefault();

    const $input = $('input');

    $p.hide();
    $input.each((i, input) => validateInput.call(input));

    if ($input.hasClass('error_message')) {
      $p.show();
    }

  });
});
