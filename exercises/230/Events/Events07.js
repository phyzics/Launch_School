document.addEventListener('DOMContentLoaded', () => {
  function removeHighlights() {
    const highlighted = document.querySelector('.highlight');

    if (highlighted) highlighted.classList.remove('highlight');
  }

  function highlight(e) {
    removeHighlights();

    const target = e.target;

    if (target.tagName === 'A') {
      const href = target.getAttribute('href');
      document.querySelector(href).classList.add('highlight');
    } else if (target.parentElement.tagName === 'ARTICLE') {
      target.parentElement.classList.add('highlight');
    } else {
      document.querySelector('main').classList.add('highlight');
    }
  }

  document.addEventListener('click', highlight);
});
