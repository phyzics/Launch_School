// vehicle.js
function Vehicle() {}

function Coupe() {}

function Motorcycle() {}

function Sedan() {}

var sedan;
var coupe;
var coupe2;
var motorcycle;
var sedan2;

Vehicle.prototype = {
  doors: 4,
  wheels: 4,
}

Coupe.prototype = new Vehicle();
Coupe.prototype.doors = 2;
Coupe.prototype.constructor = Coupe;

Motorcycle.prototype = new Vehicle();
Motorcycle.prototype.doors = 0;
Motorcycle.prototype.wheels = 2;
Motorcycle.prototype.constructor = Motorcycle;

Sedan.prototype = Object.create(Vehicle.prototype);

sedan = new Vehicle();
coupe = new Vehicle();
coupe2 = new Coupe();
motorcycle =  new Motorcycle();
sedan2 = new Sedan();

coupe.doors = 2;

console.log(sedan.hasOwnProperty('doors'));
console.log(coupe.hasOwnProperty('doors'));
console.log();
console.log(motorcycle instanceof Motorcycle);
console.log(coupe2 instanceof Coupe);
console.log(coupe2 instanceof Motorcycle);
console.log(coupe2 instanceof Vehicle);
console.log();
console.log(sedan2 instanceof Sedan);
console.log(sedan2 instanceof Vehicle);
