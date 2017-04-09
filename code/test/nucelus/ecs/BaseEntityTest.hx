package nucelus.ecs;

import massive.munit.Assert;

class BaseEntityTest
{
    @Test
	public function getGetsAddedComponent():Void
	{
        var e = new BaseEntity();
		var expected = new Component(e);
        e.add(expected);
        
        var actual = e.get("Component");
        Assert.areEqual(expected, actual);
	}

    // Don't override if you call add again
    @Test
	public function getGetsFirstAddedComponent():Void
	{
        var e = new BaseEntity();
		var expected = new Component(e);
		var wrong = new Component(e);
        e.add(expected);
        e.add(wrong);
        
        var actual = e.get("Component");
        Assert.areEqual(expected, actual);
	}

    @Test
    public function bindCausesCallbacksToTrigger():Void
    {
        var e = new BaseEntity();
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

    @Test
    public function hasReturnsTrueIfEntityHasComponent():Void
    {
        var e = new BaseEntity();
        var c = new Component(e);
        e.add(c);

        Assert.isTrue(e.has("Component"));
        
        e.remove(c);
        Assert.isFalse(e.has("Component"));
    }
}