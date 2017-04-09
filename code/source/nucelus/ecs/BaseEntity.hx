package nucelus.ecs;

import haxe.ds.HashMap;

// Logical separation of concerns. Basic ECS stuff.
class BaseEntity
{
    public var name(default, default):String; // optional

    // One component per type. Map the name to the component.
    private var components = new Map<String, Component>();
    private var eventCallbacks = new Map<String, Void->Void>();

    public function new() { }

    public function add(component:Component):Void
    {
        var type:String = getKey(component);
        if (this.components.get(type) == null)
        {
            this.components.set(type, component);
        }
    }

    public function remove(component:Component):Void
    {
        this.components.remove(getKey(component));
    }

    public function has(type:String):Bool
    {
        return this.components.exists(type);
    }

    public function get(type:String):Component
    {
        var toReturn:Component = this.components.get(type);
        return toReturn;
    }

    public function bind(event:String, callback:Void->Void):Void
    {
        this.eventCallbacks.set(event.toLowerCase(), callback);
    }

    // internal
    public function onEvent(event:String):Void
    {
        var callback = this.eventCallbacks.get(event.toLowerCase());
        if (callback != null)
        {
            callback();
        }
    }

    private function getKey(component:Component):String
    {
        var type:String = Type.getClassName(Type.getClass(component));
        if (type.indexOf(".") > -1) {
            // a.b.c => c
            type = type.substr(type.lastIndexOf(".") + 1);
        }

        return type;
    }
}