package nucelus.ecs;

// A collection of systems (and entiites).
class Container
{
    private var systems = new Array<System>();

    public function new() { }

    public function addSystem(s:System):Void
    {
        this.systems.push(s);
    }

    public function addEntity(e:BaseEntity):Void
    {
        for (system in this.systems)
        {
            system.addEntity(e);
        }
    }

    public function removeEntity(e:BaseEntity):Void
    {
        for (system in systems)
        {
            system.removeEntity(e);
        }
    }
}