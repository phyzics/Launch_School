$(() => {
  const Cars = {
    cars: [
      { make: 'Honda', image: 'images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000},
      { make: 'Honda', image: 'images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
      { make: 'Toyota', image: 'images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
      { make: 'Toyota', image: 'images/toyota-corrolla-2016.jpg', model: 'Corrolla', year: 2016, price: 15000 },
      { make: 'Suzuki', image: 'images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
      { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
      { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
    ],

    getCars (obj) {
      return this.cars.filter((car) => {
        return Object.keys(obj).every(key => {
          return obj[key] === car[key];
        });
      });
    },
  };

  const UI = {
    template: null,
    $main: $('main'),
    $options: $('#model option'),

    getTemplate () {
      const $template = $('#carsTemplate').remove();

      return Handlebars.compile($template.html());
    },

    showAllOptions () {
      this.$options.show();
    },

    hideAllOptions () {
      this.$options.hide();
    },

    showOptions ($matches) {
      this.hideAllOptions();
      $matches.show();
    },

    renderTemplate (cars) {
      this.$main.html(this.template({ cars: cars }));
    },

    init () {
      this.template = this.getTemplate();
      this.renderTemplate(Cars.cars);
    },
  };

  const Application = {
    $filter: $('#filter'),
    $make: $('#make'),

    getFilterObject () {
      const obj = {};
      const propArr = $('select').map((i, s) => {
        const $s = $(s);
        const key = $(s).attr('id');
        const val = $(s).val();

        return { [key]: val };
      }).get();

      propArr.forEach(o => {
        let key;

        for (key in o) {
          if (o[key] !== 'Any' && o[key] !== 'All') {
            if(key === 'year' || key === 'price') {
              obj[key] = Number(o[key]);
            } else {
              obj[key] = o[key];
            }
          }
        }
      });

      return obj;
    },

    filterCars () {
      const obj = this.getFilterObject();

      if (Object.keys(obj).length === 0) {
        UI.renderTemplate(Cars.cars);
      } else {
        let matches = Cars.getCars(obj);

        UI.renderTemplate(matches);
      }
    },

    filterOptions () {
      const val = this.$make.val();
      const $options = $('#model').find('option');

      if (val === 'All') {
        UI.showAllOptions();
      } else {
        const $matches = $options.filter((i, op) => {
          const dataMake = $(op).attr('data-make');

          return dataMake === val || dataMake === 'All'
        });

        UI.showOptions($matches);
      }
    },

    bindEvents () {
      this.$filter.on('click', this.filterCars.bind(this));
      $('#make').on('change', this.filterOptions.bind(this));
    },

    init () {
      UI.init();
      this.bindEvents();
    },
  };

  Application.init();
});
