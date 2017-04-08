package nucelus.ecs;

class Component
{
    private var parent:Entity;

    public function new(parent:Entity)
    {
        this.parent = parent;
    }
}