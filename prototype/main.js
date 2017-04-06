Game = {    
    start: function() {
        TESTING_UNIVERSE_SEED = 1;

        Crafty.init(960, 540);
        SeededRng.setSeed(TESTING_UNIVERSE_SEED);

        Crafty.enterScene("Title");        
    }
}

window.addEventListener('load', Game.start);
