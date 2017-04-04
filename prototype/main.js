Game = {  
  start: function() {
    TESTING_UNIVERSE_SEED = "eman stories";
    Crafty.init(960, 540);
    Crafty.enterScene("Selection");

    SeededRng.setSeed(TESTING_UNIVERSE_SEED);
  }
}

window.addEventListener('load', Game.start);
