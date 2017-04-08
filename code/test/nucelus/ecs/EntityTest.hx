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

    @Test
    public function bindCausesCallbacksToTrigger():Void
    {
        var e = new Entity();
        var health = new Component(e);
        var timesInvoked = 0;

        e.bind("Death", function() {
            timesInvoked += 1;
        });

        health.trigger("Death");
        
        // Case-insensitive!
        health.trigger("dEAtH");

        health.trigger("derp");

        Assert.areEqual(2, timesInvoked);
    }
}