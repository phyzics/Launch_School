// ppObjectFactories.js
/* #1
  similar: the getDescription() function
  different: the values of `name` and `continent`
*/
function makeCountry(name, continent, visited = false) {
  return {
    name: name,
    continent: continent,
    visited: visited,
    getDescription: function() {
      return this.name + ' is located in ' + this.continent + '. I' +
      (this.visited ? 'have' : "haven't") + ' visited ' + this.name + '.';
    },

    visitCountry: function() {
      this.visited = true;
    }
  };
}

var chile = makeCountry('The Republic of Chile', 'South America');
var canada = makeCountry('Canada', 'North America');
var southAfrica = makeCountry('The Republic of South Africa', 'Africa');

chile.getDescription();
canada.getDescription();
southAfrica.getDescription();
