// makeCar.js
function makeCar(rate, brakeRate) {
  return {
    speed: 0,
    rate: rate,
    brakeRate: brakeRate,
    accelerate: function() {
      this.speed += this.rate;
    },

    brake: function() {
      this.speed -= this.brakeRate;
      if (this.speed < 0) this.speed = 0;
    }
  };
}

var hatchback = makeCar(9);
var sedan = makeCar(8, 6);
sedan.accelerate();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);
