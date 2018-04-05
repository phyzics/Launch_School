// functions_05.js - Variable Scope
function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

/*
  guess: 'This is global'
  - since `myVar` is not declared within `someFunction()` and there is no global
    `myVar` previously declared, JS declares it for us
  - correct! though technically it is not declared at the global level, but
    rather is bound as a "property" of the *global* object
*/
