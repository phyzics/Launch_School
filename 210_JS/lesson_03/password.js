// password.js
var failedAttempts = 0;
var input;

while (failedAttempts < 3) {
  input = prompt('What is the password: ');

  if (input === 'password') {
    break;
  }

  failedAttempts++;
}

input === 'password' ? console.log('You have successfully logged in.') : console.log('You have been denied access.');
