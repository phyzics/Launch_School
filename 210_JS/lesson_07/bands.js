function updateCountry(band) {
  band.country = 'Canada';
}

function capitalizeBandName(band) {
  var name = band.name;
  var words = name.split(' ');
  name = words.map(function (word) {
    return word[0].toUpperCase() + word.slice(1);
  }).join(' ');
  band.name = name;
}

function removeDotsInBandName(band) {
  band.name = band.name.replace(/[.]/g, '');
}

function processBands(data) {
  return data.map(function (band) {
    updateCountry(band);
    capitalizeBandName(band);
    removeDotsInBandName(band);
    return band;
  });
}

var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

processBands(bands);

console.log(bands);

// Non mutative solution (Ls)
function processBands(bands) {
  return bands.map(function (band) {
    var capitalizedName = capitalizePhrase(band.name);
    var newBandName = removeDotsInString(capitalizedName);

    return {
      name: newBandName,
      country: 'Canada',
      active: band.active,
    };
  });
}

function capitalizePhrase(phrase) {
  var capitalizedPhrase = phrase.split(' ').map(function (word) {
    return capitalizeString(word);
  }).join(' ');

  return capitalizedPhrase;
}

function capitalizeString(string) {
  var initial = string[0].toUpperCase();
  var rest = string.slice(1, string.length);
  return initial + rest;
}

function removeDotsInString(string) {
  return string.replace(/\./g, '');
}
