(function(exports) {

    var rng;
    var seed;

    exports.getSeed = function() {
        return this.seed;
    }

    exports.setSeed = function(seed) {
        this.seed = seed;
        rng = new Math.seedrandom(seed);
    };

    exports.randomBetween = function(a, b) {
        return Math.floor(rng() * (b - a)) + a;
    };

    exports.random = function(array) {
        var index = SeededRng.randomBetween(0, array.length);
        return array[index];
    };

    exports.setSeed("default seed");
})(this.SeededRng = {});
