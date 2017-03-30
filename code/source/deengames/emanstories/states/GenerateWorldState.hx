package deengames.emanstories.states;

import flixel.FlxG;
import flixel.text.FlxText;
import quasar.core.QuasarState;
import quasar.io.JsonParser;
import deengames.emanstories.model.World;

class GenerateWorldState extends QuasarState
{    
    private static inline var SEED_FOR_TESTING:Int = 1;
    
    private var statusText:FlxText;

    override public function create()
    {
        super.create();
        var world = new World(SEED_FOR_TESTING);

        trace(JsonParser.parse("assets/data/stories.json"));
        
        this.statusText = new FlxText(0, 0, "", 32);
        this.statusText.text = 'Generating world ${world.seed} ...';
        this.statusText.x = (this.width - this.statusText.width) / 2;
        this.statusText.y = (this.height - this.statusText.height) / 2;
        add(this.statusText);

        this.after(1, function() {
            FlxG.switchState(new AreaMapState());
        });
    }
}