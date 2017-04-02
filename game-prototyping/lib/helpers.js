/// A collection of random functions. See below.

// Used as a global click handler. You can check for a global click by using
// an EnterFrame event and checking if(mouseDown) { ... }
window.onload = function() {
  // global mouse handler
  window.mouseDown = 0;

  document.body.onmousedown = function() {
    mouseDown++;
  }
  document.body.onmouseup = function() {
    mouseDown--;
  }
}
