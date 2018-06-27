function startCounting() {
  var num = 1;
  id = setInterval(function () {
    console.log(num);
    num += 1;
  }, 1000);
}

function stopCounting() {
  clearInterval(id);
}

var id;
