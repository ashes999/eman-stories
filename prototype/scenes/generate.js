Crafty.defineScene('WorldGeneration', function() {
    Crafty.background('black');
  
    // DATA!!!

    // TODO: link these to a sprite
    var protagonists = [
        "Ahmad, a small, scrawny boy who spent more time with books than people",
        "Laylah, a hijab-clad tomboy of a girl adept at stick-fighting and wrestling",
        "AlHabash, the dark-skinned son of a slave with an affinity for animals"
    ];
    

    // TODO: link these to a sprite
    var nemeses = [ "Evil Wizard", "Dark Lich", "Red Knight"];

    var stories = [
        {
            "intro": ["Your father, the last guardian of the ancient Sword of Eman, gets murdered. Your father's",
                      "final letter to you urges you to travel to the Lost Masajid and recharge the sword so that",
                      "you can defeat this fiend!"],

            "endingTwists": [
                "{nemesis} was your childhood friend who disappeared!",
                "The sword is just a piece of metal. Determination and du'a mde it work ...",
            ]
        },
        {
            "intro": ["An ancient evil awakens. You arrive home one day after herding sheep to discover that",
                      " your village was razed to the ground, and your family crest taken. Find the person",
                      " who did this!"],

            "endingTwists": [
                "This evil rose due to the sins of our nations. We fed this beast.",
                "{nemesis} did this because his family died. He wanted revenge on the world, and on God.",
            ]
        }
    ];

    // "Generate" world
    var protagonist = SeededRng.random(protagonists);
    var nemesis = SeededRng.random(nemeses);
    var story = SeededRng.random(stories);
    // Replaces the first {nemesis} with the actual nemesis name.
    var plotTwist = SeededRng.random(story.endingTwists).replace("{nemesis}", nemesis);

    Crafty.e("WhiteText").text("World #" + SeededRng.getSeed());

    Crafty.e("WhiteText").text("You are " + protagonist + ".").move(0, 48);
    
    for (var i = 0; i < story.intro.length; i++) {
        var line = story.intro[i];
        Crafty.e("WhiteText").text(line).move(0, 64 + (i+1) * 32);
    }

    console.log("Plot twist: " + plotTwist);
});

Crafty.c("WhiteText", {
    init: function(text) {
        this.requires("Text2, Move");
        this.fontSize(24);
        this.text(text);
        this.textColor("white");
    }
})