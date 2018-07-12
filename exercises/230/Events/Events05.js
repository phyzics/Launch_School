const main = document.querySelector('main');
const sub = document.querySelector('#sub');

main.addEventListener('contextmenu', e => {
  e.preventDefault();

  alert('Main');
});

sub.addEventListener('contextmenu', e => {
  e.stopPropagation();
  e.preventDefault();

  alert('Sub');
});
