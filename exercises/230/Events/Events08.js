// Events08.js - Delegate Event Function
function delegateEvent(parentElement, selector, eventType, callback) {
  if (!parentElement) return;

  parentElement.addEventListener(eventType, e => {
    const childElements = parentElement.querySelectorAll(selector);
    
    for (let i = 0; i < childElements.length; i += 1) {
      if (childElements[i] === e.target) callback(e);
    }
  });

  return true;
}

var callback = function(event) {
  alert('Target: ' + event.target.tagName + "\nCurrent Target: " + event.currentTarget.tagName);
};
