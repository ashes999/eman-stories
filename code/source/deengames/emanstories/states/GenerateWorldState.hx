package deengames.emanstories.states;

import quasar.core.QuasarState;
import deengames.emanstories.model.World;

class GenerateWorldState extends QuasarState
{
    private static inline var SEED_FOR_TESTING:Int = 1;

    override public function create()
    {
        super.create();
        var world = new World(SEED_FOR_TESTING);
        trace('Playing story #${world.seed}');
    }
}