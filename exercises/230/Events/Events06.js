document.addEventListener('DOMContentLoaded', () => {
  function getMatches(e) {
    const value = e.currentTarget.value.toLowerCase();
    const table = e.currentTarget.id === 'animals' ? ANIMAL_TO_CLASS : CLASS_TO_ANIMAL;

    return table[value];
  }

  function getElement(e) {
    return e.currentTarget.id === 'animals' ? animalClassifications : animals;
  }

  function setMatches(e) {
    const matches = getMatches(e);
    const element = getElement(e);

    if (matches) {
      const options = Array.prototype.slice.call(element.children);

      options.forEach(option => {
        if (matches.includes(option.value)) {
          option.className = 'visible';
        } else {
          option.className = 'hidden';
        }
      });
    }
  }

  const CLASS_TO_ANIMAL = {
    vertebrate: ['Bear', 'Turle', 'Whale', 'Salmon', 'Ostrich'],
    'warm-blooded': ['Bear', 'Whale', 'Ostrich'],
    'cold-blooded': ['Salmon', 'Turtle'],
    mammal: ['Bear', 'Whale'],
    bird: ['Ostrich'],
  };
  const ANIMAL_TO_CLASS = {
    bear: ['Vertebrate', 'Warm-blooded', 'Mammal'],
    turtle: ['Vertebrate', 'Cold-blooded'],
    whale: ['Vertebrate', 'Warm-blooded', 'Mammal'],
    salmon: ['Vertebrate', 'Cold-blooded'],
    ostrich: ['Vertebrate', 'Warm-blooded', 'Bird'],
  };
  const animalClassifications = document.querySelector('#animal-classifications');
  const animals = document.querySelector('#animals');

  animalClassifications.addEventListener('input', setMatches);
  animals.addEventListener('input', setMatches);

  document.querySelector('#clear').addEventListener('click', e => {
    const options = document.querySelectorAll('option');

    for (let i = 0; i < options.length; i += 1) {
      options[i].className = 'visible';
    }
  });
});
