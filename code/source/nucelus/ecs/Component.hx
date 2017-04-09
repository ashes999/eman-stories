package nucelus.ecs;

class Component
{
    private var parent:BaseEntity;

    public function new(parent:BaseEntity)
    {
        this.parent = parent;
    }

    public function trigger(event:String):Void
    {
        this.parent.onEvent(event);
    }
}