package deengames.emanstories.states;

import flixel.FlxState;
import quasar.core.QuasarState;

import turbo.ecs.components.ColourComponent;
import turbo.ecs.components.HealthComponent;
import turbo.ecs.components.ImageComponent;
import turbo.ecs.components.PositionComponent;
import turbo.ecs.components.KeyboardInputComponent;
import turbo.ecs.components.CameraComponent;
import turbo.ecs.components.MouseClickComponent;
import turbo.ecs.Entity;

class EcsTestState extends QuasarState
{
    private var e:Entity;

    override public function create()
    {
        super.create();        
        e = new Entity()
            .colour(255, 128, 0);

        this.add(e.get<ColourComponent>(ColourComponent).sprite);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}