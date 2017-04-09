package nucelus.ecs;

import massive.munit.Assert;

@:access(nucelus.ecs.System)
class ContainerTest
{
    // Super-set of system tests, since it relies on that functionality.
    // Hence, no additional system tests. We're covered.
    @Test
	public function addEntityAddsItToAllSystems():Void
	{
        var s1 = new System(["Component"]);
        var s2 = new System(["Component"]);

        var e = new BaseEntity();
		var component = new Component(e);
        e.add(component);
        
        var container = new Container();
        container.addSystem(s1);
        container.addSystem(s2);

        container.addEntity(e);
        Assert.isTrue(s1.entities.indexOf(e) > -1);
        Assert.isTrue(s2.entities.indexOf(e) > -1);

        container.removeEntity(e);

        Assert.isTrue(s1.entities.indexOf(e) == -1);
        Assert.isTrue(s2.entities.indexOf(e) == -1);
	}
}