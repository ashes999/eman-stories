package deengames.emanstories.model;

import deengames.emanstories.model.World;
import deengames.emanstories.data.Repository;

import massive.munit.Assert;

class WorldTest 
{
    private function createRepository():Repository
    {
        var storiesJson = '{ "archtypes": [ { "summary": "unleash ancient weapon in time to save the world", "majorEvents": [] } ] }';
        var locationsJson = '{ "locations": [ "mountains", "valley" ], "themes": [ "fire", "mysterious" ] }';
        return new Repository(storiesJson, locationsJson);
    }

    @Test
    public function constructorGeneratesNewSeed():Void
    {
        var repository = createRepository();
        var w1 = new World(repository);
        var w2 = new World(repository);

        Assert.areNotEqual(w1.seed, w2.seed);
    }

    @Test
    public function constructorSetsSeedToInput():Void
    {
        var repository = createRepository();        
        var expected:Int = 18282;
        var world = new World(repository, expected);
        Assert.areEqual(expected, world.seed);
    }

    @Test
    public function instanceIsSetToLastInstanceCreated():Void
    {
        var repository = createRepository();
        
        var w1 = new World(repository);
        Assert.areEqual(w1, World.instance);

        var w2 = new World(repository);
        Assert.areEqual(w2, World.instance);                        
    }
}