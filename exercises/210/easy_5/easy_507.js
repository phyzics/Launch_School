// easy_507.js - Name Swapping
function swapName(name) {
  return name.replace(/(\w+)\s(\w+)/, '$2, $1');
}

console.log(swapName('Joe Roberts'));
