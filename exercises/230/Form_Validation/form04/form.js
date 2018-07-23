$(() => {
  function sendRequest($form) {
    const serializedArr = $form.serializeArray();
    const dataObj = {
      first_name: '',
      last_name: '',
      email: '',
      password: '',
      phone_number: '',
      credit_card: '',
    };
    let data = [];
    let key;

    serializedArr.forEach(obj => {
      dataObj[obj.name] += obj.value
    });

    for (key in dataObj) {
      data.push(`${encodeURIComponent(key)}=${encodeURIComponent(dataObj[key])}`);
    }

    $('#request').show().text(data.join('&'));
  }

  function formatName(name) {
    return name.split('_').map(word => word.slice(0, 1).toUpperCase() + word.slice(1)).join(' ');
  }

  function autoTab() {
    const $input = $(this);

    if ($input.val().length === 4) $input.next().focus();
  }

  function validateKeypress(e) {
    const $this = $(this);
    const key = e.which;
    const value = String.fromCharCode(key);

    if ($this.hasClass('credit_card')) {
      if (!/\d/.test(value)) e.preventDefault();
    } else if ($this.attr('id') === 'phone_number') {
      if (!/\d|-/.test(value)) e.preventDefault();
    } else {
      if (!/[a-zA-Z\s']/.test(value)) e.preventDefault();
    }
  }

  function getErrorMessage(element) {
    switch (element.name) {
      case 'phone_number':
        return ERROR_MSGS[2];
      case 'email':
        return ERROR_MSGS[1];
      case 'password':
        return ERROR_MSGS[3];
      case 'first_name':
        return ERROR_MSGS[4];
      case 'last_name':
        return ERROR_MSGS[5];
      case 'credit_card':
        return ERROR_MSGS[6];
    }
  }

  function validateInput() {
    const target = this;
    const $span = $(target).nextAll('span');
    const inputName = formatName(target.name);
    const valueMissing = target.validity.valueMissing;

    if (valueMissing && target.getAttribute('id') !== 'phone_number') {
      $span.text(inputName + ERROR_MSGS[0]);
      $(target).addClass('error_message');
    } else if (!valueMissing) {
      if (target.validity.patternMismatch) {
        $span.text(getErrorMessage(target));
        $(target).addClass('error_message');
      }
    }
  }

  const $form = $('form');
  const $email = $('#email');
  const $password = $('#password');
  const $phoneNumber = $('#phone_number');
  const ERROR_MSGS = [
    ' is a required field.',
    'Please Enter a valid Email.',
    'Please Enter a valid Phone Number.',
    'Password must be at least 10 characters long.',
    'Please Enter a valid First Name.',
    'Please Enter a valid Last Name.',
    'Please Enter a valid Credit Card.'
  ];

  $('.credit_card').eq(-1).prevAll().on('keyup', autoTab);
  $form.on('blur', 'input', validateInput);
  $form.on('focus', 'input', e => {
    const $target = $(e.target);

    if ($target.hasClass('error_message')) {
      $target.removeClass('error_message');
      $target.next().text('');
    }
  })
  $form.on('keypress', 'input.credit_card, #phone_number, #first_name, #last_name', validateKeypress);
  $form.on('submit', e => {
    e.preventDefault();

    const $input = $('input');
    const $error = $('#form_error');

    $error.hide();
    $input.each((i, input) => validateInput.call(input));

    if ($input.hasClass('error_message')) {
      $error.show();
    } else {
      sendRequest($form);
    }
  });
});
