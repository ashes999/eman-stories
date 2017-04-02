// Inclusive of a, exclusive of b
// AKA: [a, b)
// AKA: a <= n < b
function randomBetween(a, b) {
  return Math.floor(Math.random() * (b - a)) + a;
}

// Hash contains probabilities, and options. Numbers can be decimal
// or whole, and don't need to add up to 1.0 or 100. For example:
// { "apples": 80, "bananas": 20 }
// { "chicken": 0.5, "beef": 0.4, "veal": 0.3 }
function weightedRandom(hash) {
  // Break hash into two lists. Filters out anything with p=0.
  var list = [];
  var weight = [];

  for (var k in hash) {
    // http://stackoverflow.com/a/11561440/210780
    // use hasOwnProperty to filter out keys from the Object.prototype
    if (hash.hasOwnProperty(k)) {
      var p = hash[k];
      if (p > 0) {
        list.push(k);
        weight.push(p);
      }
    }
  }

  // http://codetheory.in/weighted-biased-random-number-generation-with-javascript-based-on-probability/

  var total_weight = weight.reduce(function (prev, cur, i, arr) {
      return prev + cur;
  });

  var random_num = randomBetween(0, total_weight);
  var weight_sum = 0;

  for (var i = 0; i < list.length; i++) {
      weight_sum += weight[i];
      weight_sum = +weight_sum.toFixed(2);

      if (random_num <= weight_sum) {
          return list[i];
      }
  }
};
