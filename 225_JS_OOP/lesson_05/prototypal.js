// prototypal.js - Prototypal Inheritance and Behavior Delegation
/*
1)  1

2) 2

3) No, because `far` may have its own local `myProp` property whose value also
   happens to be `1`

   We can use either `far.hasOwnProperty(myProp)` or
   `Object.getOwnPropertyNames(far)` to see if `myProp` exists locally on `far`.
*/
