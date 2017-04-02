Crafty.defineScene('Selection', function() {
  Crafty.background('black');
  Crafty.e('Actor, Text2').color('red').text("Slimes").size(50, 50).move(50, 50).click(function() {
    Crafty.enterScene('Battle', { name: 'Slime', color: '#880000' });
  });
  Crafty.e('Actor, Text2').color('green').text("Bees").size(50, 50).move(150, 50).click(function() {
    Crafty.enterScene('Battle', { name: 'Bee', color: '#008800' });
  });
});
