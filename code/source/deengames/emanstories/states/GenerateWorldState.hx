package deengames.emanstories.states;

import flixel.text.FlxText;
import quasar.core.QuasarState;
import deengames.emanstories.model.World;

class GenerateWorldState extends QuasarState
{
    private static inline var SEED_FOR_TESTING:Int = 1;
    private var text:FlxText;

    override public function create()
    {
        super.create();
        var world = new World(SEED_FOR_TESTING);
        
        this.text = new FlxText(0, 0, "", 32);
        this.text.text = 'Generating world ${world.seed} ...';
        this.text.x = (this.width - this.text.width) / 2;
        this.text.y = (this.height - this.text.height) / 2;
        add(this.text);
    }
}