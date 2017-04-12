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
    // TODO: move to infrastructure
    private var entities = new Array<Entity>();

    override public function create()
    {
        super.create();        

        // TODO: this is infrastructure
        ImageComponent.onAdd = function(i) {
            this.add(i.sprite);
        }
        ColourComponent.onAdd = function(c) {
            this.add(c.sprite);
        }
        ColourComponent.onRemove = function(c) {
            this.remove(c.sprite);
        }

        var e = new Entity()
            .colour(255, 0, 0)
            //.image("assets/images/ui/new-game-button.png")
            .move(200, 100).health(50)
            .size(128, 128);

        e.moveWithKeyboard(100);
        e.onClick(function(x, y) {
            trace("CLICK!");
            this.remove(e.get(ColourComponent).sprite);
            e.remove(ColourComponent);
            e.image("assets/images/ui/new-game-button.png");            
        });

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