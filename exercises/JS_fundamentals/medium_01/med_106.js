// med_106.js - Logger
function debugIt() {
  var status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

  // since the variable status was declared within the functional scope of debugIt(),
  // it is available to any nested functions, and so logger() is able to access it,
  // hence why it is logged when we invoke debugIt() on line 11 since logger() is called
  // in the function definition on line 8
