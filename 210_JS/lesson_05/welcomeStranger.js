// welcomeStranger.js - "Wha'cha buyin'..."
function greetings(name, job) {
  var fullName = name.join(' ');
  var fullJob = job['title'] + ' ' + job['occupation'];
  console.log('Hello, ' + fullName + '! Nice to have a ' + fullJob + ' around.')
}

// Launch School's solution
function greetings(name, status) {
  var nameGreet = 'Hello, ' + name.join(' ') + '!';
  var statusGreet = 'Nice to have a ' status.title + ' ' + status.occupation + ' around.';
  console.log(nameGreet + ' ' + statusGreet);
}
