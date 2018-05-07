// strings_16.js
var name = prompt('What is your name?');

if (name.endsWith('!')) {
  name = name.slice(0, -1).toUpperCase;
  console.log('HELLO ' + name + '. WHY ARE WE SCREAMING?')
} else {
  console.log('Hello ' + name + '.');
}
