Crafty.c("Wall", {
    init: function() {
        this.requires("Actor, Solid").color("#888888");
    }
});

Crafty.defineScene('Map', function() {
    Crafty.background('#008800');

    Crafty.e("Player").move(100, 100);

    Crafty.e("Wall").size(960, 8);
    Crafty.e("Wall").size(960, 8).move(0, 540 - 8);
    Crafty.e("Wall").size(8, 540);
    Crafty.e("Wall").size(8, 540).move(960 - 8, 0);
});