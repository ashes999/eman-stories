Game = {    
    start: function() {
        TESTING_UNIVERSE_SEED = 1;

        Crafty.init(960, 540);
        SeededRng.setSeed(TESTING_UNIVERSE_SEED);

        Crafty.enterScene("Title");        
    }
}

window.prototypePath = ""; // don't load from within ../game-prototyping

loadScript("scenes/miscScenes.js");
loadScript("scenes/generateScene.js");

loadScript("battle/monster.js");
loadScript("battle/player.js");
loadScript("battle/battleScene.js");

loadScript("map/mapScene.js");

window.addEventListener('load', Game.start);
