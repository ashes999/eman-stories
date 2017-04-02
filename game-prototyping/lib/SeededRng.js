(function(exports) {

  var rng;

  exports.setSeed = function(seed) {
    rng = new Math.seedrandom(seed);
  };

  exports.randomBetween = function(a, b) {
    return Math.floor(rng() * (b - a)) + a;
  };

  exports.setSeed("default seed");

})(this.SeededRng = {});
