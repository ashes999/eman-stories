Game = {
  start: function() {
    Crafty.init(960, 540);
    Crafty.enterScene("Selection");
    Game.seedRng(1024768);
  },

  seedRng: function(seed) {
    Game.seededRng = new Math.seedrandom(seed);
  },

  seededRandomBetween: function(a, b) {
    return Math.floor(Game.seededRng() * (b - a)) + a;
  }
}

window.addEventListener('load', Game.start);
