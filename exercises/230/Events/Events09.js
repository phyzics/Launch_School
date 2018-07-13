const divRed = document.getElementById('red');
const divBlue = document.getElementById('blue');
const divGreen = document.getElementById('green');
const divOrange = document.getElementById('orange');
const tracker = (() => {
  events = [];

  return {
    list () {
      return events.slice();
    },

    add (event) {
      return events.push(event);
    },

    elements () {
      return events.map(function (event) {
        return event.target;
      }).slice();
    },

    clear () {
      events = [];

      return events.length;
    }
  }
})();

function track(callback) {
  return event => {
    if (!event.tracked) {
      tracker.add(event);
      event.tracked = true;
    }

    callback(event);
  }
}

divRed.addEventListener('click', track(function() {
  document.body.style.background = 'red';
}));

divBlue.addEventListener('click', track(function() {
  event.stopPropagation();
  document.body.style.background = 'blue';
}));

divOrange.addEventListener('click', track(function() {
  document.body.style.background = 'orange';
}));

divGreen.addEventListener('click', track(function() {
  document.body.style.background = 'green';
}));
