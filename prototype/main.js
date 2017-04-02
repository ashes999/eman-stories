Game = {
  start: function() {
    Crafty.init(960, 540);
    Crafty.enterScene("Selection");
  }
}

window.addEventListener('load', Game.start);
