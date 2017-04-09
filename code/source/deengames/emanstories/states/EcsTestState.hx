package deengames.emanstories.states;

import flixel.FlxState;
import quasar.core.QuasarState;

import nucelus.ecs.Container;
import nucelus.ecs.Entity;
import nucelus.ecs.systems.SpriteSystem;
import nucelus.ecs.components.SpriteComponent;

class EcsTestState extends QuasarState
{
    private var container:Container = new Container();

    override public function create()
    {
        super.create();
        container.addSystem(new SpriteSystem(function(s) {
            this.add(s.image);
        }));
        
        var e = new Entity();
        var s = new SpriteComponent("assets/images/ui/new-game-button.png", e);
        e.add(s);
        
        container.addEntity(e);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        container.update(elapsed);
    }
}