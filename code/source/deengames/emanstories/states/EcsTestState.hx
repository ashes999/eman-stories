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
            .image("assets/images/ui/new-game-button.png")
            .move(200, 100).health(50);

        e.get(HealthComponent).damage(5);
        trace('E: ${e.get(HealthComponent).currentHealth}/${e.get(HealthComponent).totalHealth}');

        this.add(e.get(ImageComponent).sprite);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}