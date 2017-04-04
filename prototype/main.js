Game = {    
    start: function() {
        TESTING_UNIVERSE_SEED = 12345;

        Crafty.init(960, 540);
        SeededRng.setSeed(TESTING_UNIVERSE_SEED);

        Crafty.enterScene("WorldGeneration");        
    }
}

window.addEventListener('load', Game.start);
