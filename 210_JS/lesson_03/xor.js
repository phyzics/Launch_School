// xor.js
function isXor(a, b) {
  return !!a === !!b ? false : true;
}

/*
  - have guard clauses that check immediately if either both values are truthy
    or falsy
      - Boolean(x) for both and compare, if its true then they're the same
  - return true if it passes
*/
