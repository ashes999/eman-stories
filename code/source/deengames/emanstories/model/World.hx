package deengames.emanstories.model;

class World
{
    private static inline var MAX_SEED:Int = 2000000000; // 2B
    // Represents a unique world (game), by means of a seed number.
    // All randomly-generated stuff uses that seed.
    public var seed(default, null):Int;

    public function new(seed:Int = -1)
    {
        if (seed < 0)
        {
            seed = Math.round(Math.random() * MAX_SEED);
        }

        this.seed = seed;

        trace('World created with seed=${seed}');
    }
}