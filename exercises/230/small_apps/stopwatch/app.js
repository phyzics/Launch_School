$(() => {
  const Timer = {
    hours: 0,
    minutes: 0,
    seconds: 0,
    centsec: 0,
    $hours: $('#hours'),
    $minutes: $('#minutes'),
    $seconds: $('#seconds'),
    $centsec: $('#centiseconds'),

    reset () {
      this.hours = 0;
      this.minutes = 0;
      this.seconds = 0;
      this.centsec = 0;
    },

    start () {
      this.id = setInterval(() => {
        this.incrementCentSec();

      }, 10);
    },

    stop () {
      clearInterval(this.id);
    },

    incrementHours () {
      this.hours += 1;
      UI.renderTime(this.$hours, this.hours);
    },

    incrementMinutes () {
      this.minutes += 1;

      if (this.minutes === 60) {
        this.minutes = 0;
        this.incrementHours();
      }

      UI.renderTime(this.$minutes, this.minutes);
    },

    incrementSeconds () {
      this.seconds += 1;

      if (this.seconds === 60) {
        this.seconds = 0;
        this.incrementMinutes();
      }

      UI.renderTime(this.$seconds, this.seconds);
    },

    incrementCentSec () {
      this.centsec += 1;

      if (this.centsec === 100) {
        this.centsec = 0;
        this.incrementSeconds();
      }

      UI.renderTime(this.$centsec, this.centsec);
    },
  };

  const UI = {
    renderToggleState (state) {
      $('#toggle').html(this.formatState(state));
    },

    reset () {
      $('span').html('00');
    },

    formatState (state) {
      return state.slice(0, 1).toUpperCase() + state.slice(1);
    },

    formatTime (val) {
      return val < 10 ? String(`0${val}`) : String(val);
    },

    renderTime (element, value) {
      const val = this.formatTime(value);

      element.html(val);
    },
  };

  const Application = {
    $toggle: $('#toggle'),

    changeToggleState (state) {
      this.$toggle.attr('data-state', state);
      UI.renderToggleState(state);
    },

    resetTimer () {
      Timer.stop();
      this.changeToggleState('start');
      Timer.reset();
      UI.reset();
    },

    toggleTimer () {
      const state = this.$toggle.attr('data-state');

      if (state === 'start') {
        Timer.start();
        this.changeToggleState('stop');
      } else {
        Timer.stop();
        this.changeToggleState('start');
      }
    },

    bindEvents () {
      this.$toggle.on('click', this.toggleTimer.bind(this));
      $('#reset').on('click', this.resetTimer.bind(this));
    },

    init () {
      this.bindEvents()
    },
  };

  Application.init();
});
