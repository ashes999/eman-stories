package deengames.emanstories.states;

import flixel.FlxState;
import deengames.emanstories.model.World;

class GenerateWorldState extends FlxState
{
    private static inline var SEED_FOR_TESTING:Int = 1;

    override public function create()
    {
        var world = new World(SEED_FOR_TESTING);
        trace('Playing story #${world.seed}');
    }
}