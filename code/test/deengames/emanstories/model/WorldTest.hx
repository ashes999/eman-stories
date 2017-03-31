package deengames.emanstories.model;

import deengames.emanstories.model.World;
import deengames.emanstories.data.Repository;

import massive.munit.Assert;

class WorldTest 
{
    private var repository:Repository;

    @Before
    public function createRepository()
    {
        var storiesJson = '{ "archtypes": [ { "summary": "unleash ancient weapon in time to save the world" } ] }';
        var locationsJson = '{ "locations": [ "mountains", "valley" ], "themes": [ "fire", "mysterious" ] }';
        this.repository = new Repository(storiesJson, locationsJson);
    }

    @Test
    public function constructorGeneratesNewSeed():Void
    {
        var w1 = new World(this.repository);
        var w2 = new World(this.repository);

        Assert.areNotEqual(w1.seed, w2.seed);
    }

    @Test
    public function constructorSetsSeedToInput():Void
    {
        var expected:Int = 18282;
        var world = new World(this.repository, expected);
        Assert.areEqual(expected, world.seed);
    }

    @Test
    public function instanceIsSetToLastInstanceCreated():Void
    {
        var w1 = new World(this.repository);
        Assert.areEqual(w1, World.instance);

        var w2 = new World(this.repository);
        Assert.areEqual(w2, World.instance);                        
    }
}