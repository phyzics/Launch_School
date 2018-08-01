const persons = [
  { name: 'Victor', colors: ['Blue', 'White', 'Orange'] },
  { name: 'Kevin', colors: ['Red', 'Maroon', 'Gray'] },
  { name: 'Brandon', colors: ['Green', 'Blue', 'Gray'] }
];

const App = {
  init () {
    this.appView = new AppView();
    this.appView.render();
    this.list = new List(persons);
    this.listView = new ListView({ collection: this.list });
    this.listView.render();
  },
};

App.init();
