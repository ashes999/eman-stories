package deengames.emanstories.model;

import deengames.emanstories.model.World;

import massive.munit.Assert;

class WorldTest 
{
    @Test
    public function constructorGeneratesNewSeed():Void
    {
        var w1 = new World();
        var w2 = new World();

        Assert.areNotEqual(w1.seed, w2.seed);
    }

    @Test
    public function constructorSetsSeedToInput():Void
    {
        var expected:Int = 18282;
        var world = new World(expected);
        Assert.areEqual(expected, world.seed);
    }

    @Test
    public function instanceIsSetToLastInstanceCreated():Void
    {
        var w1 = new World();
        Assert.areEqual(w1, World.instance);

        var w2 = new World();
        Assert.areEqual(w2, World.instance);                        
    }
}