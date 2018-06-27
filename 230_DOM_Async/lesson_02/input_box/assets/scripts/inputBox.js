var cursorId;
var focusedTextField;

document.addEventListener('DOMContentLoaded', function () {
  var textfield = document.querySelector('.text-field');

  textfield.addEventListener('click', function (event) {
    event.stopPropagation();

    focusedTextField = textfield;
    textfield.classList.add('focused');

    if (!cursorId) {
      cursorId = setInterval(function() {
        textfield.classList.toggle('cursor');
      }, 500);
    }
  });
});

document.addEventListener('keypress', function (event) {
  var key;
  var content;

  if (focusedTextField) {
    key = event.key;
    content = document.querySelector('.content');
    content.textContent += key;
  }
});

document.addEventListener('keydown', function (event) {
  var content;

  if (event.key === 'Backspace' && focusedTextField) {
    content = document.querySelector('.content');
    content.textContent = content.textContent.slice(0, -1);
  }
});

document.addEventListener('click', function (event) {
  clearInterval(cursorId);
  cursorId = null;

  if (focusedTextField) {
    focusedTextField.classList.remove('focused');
    focusedTextField.classList.remove('cursor');
    focusedTextField = null;
  }
});
