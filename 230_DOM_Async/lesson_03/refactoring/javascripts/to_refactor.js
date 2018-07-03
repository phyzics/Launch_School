$(function() {
  function getLuhnTotal(ccNumber) {
    var oddTotal = 0;
    var evenTotal = 0;
    var i;

    ccNumber = ccNumber.split('').reverse();

    for  (i = 0, len = ccNumber.length; i < len; i += 1) {
      if (i % 2 === 1) {
        ccNumber[i] = String((Number(ccNumber[i]) * 2));
        if (ccNumber[i].length > 1) {
          ccNumber[i] = Number(ccNumber[i][0]) + Number(ccNumber[i][1]);
        }
        else {
          ccNumber[i] = Number(ccNumber[i]);
        }
        oddTotal += ccNumber[i];
      }
      else {
        evenTotal += Number(ccNumber[i]);
      }
    }

    return evenTotal + oddTotal;
  }

  $("nav a").on("mouseenter", function() {
    $(this).next("ul").addClass('opened');
  });

  $("nav").on("mouseleave", function() {
    $(this).find("ul ul").removeClass('opened');
  });

  $("button, .button").on("click", function(e) {
    e.preventDefault();

    $(this).addClass("clicked");
  });

  $(".toggle").on("click", function(e) {
    e.preventDefault();

    $(this).next('.accordion').toggleClass('opened');
  });

  $("form").on("submit", function(e) {
    e.preventDefault();
    var ccNumber = $(this).find("[type=text]").val();
    var total = getLuhnTotal(ccNumber);
    var isValidNumber = total % 10 === 0;


    $(this).find('.success').toggle(isValidNumber);
    $(this).find('.error').toggle(!isValidNumber);
  });

  $("ul a").on("click", function(e) {
    e.preventDefault();

    var month = $(this).text();
    var $stone = $("#birthstone");
    var STONES_BY_MONTH = {
      'January': 'garnet',
      'February': 'amethyst',
      'March': 'aquamarine or bloodstone',
      'April': 'diamond',
      'May': 'emerald',
      'June': 'pearl, moonstone, or alexandrite',
      'July': 'ruby',
      'August': 'peridot',
      'September': 'sapphire',
      'October': 'opal or tourmaline',
      'November': 'topaz or citrine',
      'December': 'turquoise, zircon, or tanzanite',
    };

    $stone.text('Your birthstone is ' + STONES_BY_MONTH[month]);
  });
});
