Crafty.c("Player", {
    init: function() {
        this.requires("Actor").size(48, 48).color("red").controllable(250).collideWith("Solid");
    }
});