package nucelus.ecs;

import massive.munit.Assert;

class EntityTest
{
    @Test
	public function getGetsAddedComponent():Void
	{
        var e = new Entity();
		var expected = new Component(e);
        e.add(expected);
        
        var actual = e.get("Component");
        Assert.areEqual(expected, actual);
	}

    @Test
	public function getGetsLastAddedComponent():Void
	{
        var e = new Entity();
		var wrong = new Component(e);
		var expected = new Component(e);
        e.add(wrong);
        e.add(expected);
        
        var actual = e.get("Component");
        Assert.areEqual(expected, actual);
	}
}