// Events03.js - Bold Element + Custom & FE
document.addEventListener('DOMContentLoaded', () => {
  const section = document.querySelector('section');

  function makeBold(element) {
    const event = new CustomEvent('bolded');

    element.style = 'font-weight: bold';
    element.dispatchEvent(event);
  }

  section.addEventListener('bolded', event => {
    if (section.contains(event.target)) section.classList.add('highlight');
  });

  makeBold(section);
});
