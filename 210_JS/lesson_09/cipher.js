function buildOscillator(n) {
  var oscillator = [];
  var i;

  for (i = 0; i < n; i += 1) {
    oscillator.push(i);
  }

  for (i = n - 2; i > 0; i -= 1) {
    oscillator.push(i);
  }

  return oscillator;
}

function buildSegments(n) {
  var segments = [];

  for (i = 0; i < n; i += 1) {
    segments.push([]);
  }

  return segments;
}

function printRows(rows) {
  rows.forEach(function (row) {
    console.log(row.join(''));
  });
}

function joinRails(rails) {
  return rails.map(function (rail) { return rail.join(''); }).join('');
}

function encryptRailCipher(text, rows) {
  var filteredText = text.replace(/[^a-z]/ig, '');
  var oscillator = buildOscillator(rows);
  var segments = buildSegments(rows);
  var j = 0;
  var i;

  for (i = 0; i < filteredText.length; i += 1) {
    segments.forEach(function (segment, idx){
      if (oscillator[j] === idx) {
        segment.push(filteredText[i]);
      }
    });

    j += 1;
    if (j === oscillator.length) j = 0;
  }

  console.log(joinRails(segments));
}

function decryptRailCipher(encryptedText, rows) {
  var oscillator = buildOscillator(rows);
  var rails = buildSegments(rows);
  var strIdx = 0;
  var railNum = 0;
  var osIdx;
  var i;

  for (railNum = 0; railNum < rows; railNum += 1) {
    osIdx = 0;

    for (i = 0; i < encryptedText.length; i += 1) {
      if (railNum == oscillator[osIdx]) {
        rails[railNum].push(encryptedText[strIdx]);
        strIdx += 1;
      } else {
        rails[railNum].push('.');
      }

      osIdx += 1;
      if (osIdx == oscillator.length) osIdx = 0;
    }
  }

  printRows(rails);
}

encryptRailCipher("WE ARE DISCOVERED FLEE AT ONCE", 3);
console.log();
encryptRailCipher("Hello Everyone!", 2);
console.log();
encryptRailCipher("WE ARE DISCOVERED FLEE AT ONCE", 1);
console.log();
decryptRailCipher("WECRLTEERDSOEEFEAOCAIVDEN", 3);
console.log();
decryptRailCipher("WECRLTEERDSOEEFEAOCAIVDEN", 2);

/*
  p:
    - take encrypted string and number of rows
    - place correct number of chars in each row
      - each row is 25 characters
      - characters pushed in one at a time
        - pushed in when row # = oscillation #
          - keep track of:
            a) string position
            b) oscillator
            c) oscillation
            d) row #
    - then return the rows


  Decrypt
  Alg:
    1) create an oscillator
      - same as encrypt
    2) set up return array
      - same as encrypt
    3) set correct characters into appropriate rail
      - keep track of current string index <-- i
      - do text.size oscillations <-- j row # of times <-- k
      - keep track of oscillator <-- l

      - on each iteration of j, if k == osc[l], then we push string[i] into subarray[k]
        - once pushed, i++
        - on each iteration, we j++ and set back to = once j == osciallator.length
        - if they do not equal each other, push '.' into subarray[k]

  Encrypt
  Alg:
    - standardize input
      - regex to replace all non alpha with '' /[^a-z]/ig, ''
    1) create an oscillator
      - take rows (n) and loop from 0 to n - 1, then from n - 2 to 1
        - push each number into the oscillator
        - [0, 1, 2, 1]; [0, 1, 2, 3, 4, 3, 2, 1]; [0, 1]
    2) set up return array
      - push n times [] into an array
    3) push appropriate letters into corresponding sub-arrays
      - loop over the string <-- i
        - use oscillator to determine which sub-array to push into <-- j
          - loop over the subarrays, and if the index === j, we push string[i]
          - o/w push '.'
          - when j => oscillator.length, set back to 0
    4) print the lines
      - looping over the main array, log each subarray.join('');
*/
