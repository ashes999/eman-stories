package nucelus.ecs;

// Base class
class System
{
    private var entities = new Array<BaseEntity>();

    // Components that must exist for us to operate on an entity
    private var requiredComponents = new Array<String>();

    public function new(requiredComponents:Array<String>)
    {
        this.requiredComponents = requiredComponents;
    }

    public function addEntity(e:BaseEntity):Void
    {
        if (entities.indexOf(e) == -1)
        {
            for (c in requiredComponents)
            {
                if (!e.has(c))
                {
                    // missing a pre-requisite
                    return;
                }
            }

            // Has everything
            this.entities.push(e);
        }
    }

    public function removeEntity(e:BaseEntity):Void
    {
        entities.remove(e);
    }
}