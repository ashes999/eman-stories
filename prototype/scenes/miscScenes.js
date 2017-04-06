// Misc scenes that don't really fit in anywhere

Crafty.defineScene('Title', function() {
    Crafty.background('black');
    Crafty.e('Text2, Move').text("Slimes").fontSize(72).text("Eman Stories").textColor("white").move(150, 150);

    Crafty.e("Actor, Text2").color("red").text("New Game").size(160, 60).move(150, 450).fontSize(24)
    .click(function() {
      Crafty.enterScene('WorldGeneration');
    });
});