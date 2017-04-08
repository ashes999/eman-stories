package nucelus.ecs;

import haxe.ds.HashMap;

class Entity
{
    public var name(default, default):String; // optional

    // One component per type. Map the name to the component.
    private var components = new Map<String, Component>();

    public function new() { }

    public function add(component:Component):Void
    {
        var type:String = Type.getClassName(Type.getClass(component));
        if (type.indexOf(".") > -1) {
            // a.b.c => c
            type = type.substr(type.lastIndexOf(".") + 1);
        }
        trace('put ${type} => ${component}!');
        this.components.set(type, component);
    }

    public function get(type:String):Component
    {
        return this.components.get(type);
    }
}