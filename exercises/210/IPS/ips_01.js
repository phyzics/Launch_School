// ips_01.js - 1000 Lights
function lightsOn(switches) {
  var lights = {};
  var i;
  var j;

  for (i = 1; i <= switches; i += 1) {
    for (j = i; j <= switches; j += i) {
      lights[j] = !lights[j];
    }
  }

  return Object.keys(lights).filter(light => lights[light]).map(Number);
}
