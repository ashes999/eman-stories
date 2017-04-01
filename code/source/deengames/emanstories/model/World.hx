package deengames.emanstories.model;

import de.polygonal.core.math.random.RNG;
import de.polygonal.core.math.random.ParkMiller;

import deengames.emanstories.data.Repository;

class World
{
    public static var instance(default, null):World; // not really singleton
    private var story:Dynamic; // json

    private static inline var MAX_SEED:Int = 2000000000; // 2B
    // Represents a unique world (game), by means of a seed number.
    // All randomly-generated stuff uses that seed.
    public var seed(default, null):Int;

    private var seededRng:RNG;

    public function new(repository:Repository, seed:Int = -1)
    {
        World.instance = this;
        
        if (seed < 0)
        {
            seed = Math.round(Math.random() * MAX_SEED);
        }

        this.seed = seed;
        this.seededRng = new ParkMiller(this.seed);

        this.story = this.randomItem(repository.stories);

        // for testing
        var numLocations:Int = 2;

        for (i in 0 ... numLocations)
        {
            var locationName = this.randomItem(repository.locationNames);
            var locationTheme = this.randomItem(repository.locationThemes);
            trace('${locationTheme} ${locationName}');
        }
    }

    // Uses seeded RNG
    private function randomItem(array:Array<Dynamic>):Dynamic
    {
         var index = Math.floor(this.seededRng.randomFloat() * array.length);
         return array[index];
    }
}