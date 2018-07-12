// Events04.js - Buggy Code
document.querySelector('img').addEventListener('click', function(event) {
  event.preventDefault();
}, false);

/*
  While using `stopPropagation` prevents the event object from bubbling back
  up from the `img` element to its parent `a` element, the default behavior will
  still take place. We have to use the event objects `preventDefault()` method
  in order to prevent any default behavior. Doing this will stop the browser
  from going to the URL of the `a` elements `href` attribute.
*/
