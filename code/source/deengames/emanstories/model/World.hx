package deengames.emanstories.model;

import de.polygonal.core.math.random.RNG;
import de.polygonal.core.math.random.ParkMiller;

class World
{
    public static var instance(default, null):World; // not really singleton

    private static inline var MAX_SEED:Int = 2000000000; // 2B
    // Represents a unique world (game), by means of a seed number.
    // All randomly-generated stuff uses that seed.
    public var seed(default, null):Int;

    private var rng:RNG;

    public function new(seed:Int = -1)
    {
        World.instance = this;
        
        if (seed < 0)
        {
            seed = Math.round(Math.random() * MAX_SEED);
        }

        this.seed = seed;
        this.rng = new ParkMiller(this.seed);
    }
}