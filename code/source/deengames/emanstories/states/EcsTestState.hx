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
    private var entities = new Array<Entity>();

    override public function create()
    {
        super.create();        
        var e = new Entity()
            .colour(255, 0, 0)
            .move(200, 100).health(50)
            .size(128, 128);

        e.moveWithKeyboard(100);
        e.onClick(function(x, y) {
            trace("CLICK!");
            e.remove(ImageComponent);
            e.image("assets/images/ui/new-game-button.png");            
        });

        this.add(e.get(ColourComponent).sprite);

        entities.push(e);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        for (e in entities)
        {
            e.update(elapsed);
        }
    }
}