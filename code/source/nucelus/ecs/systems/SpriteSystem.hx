package nucelus.ecs.systems;

import nucelus.ecs.components.SpriteComponent;
import flixel.FlxSprite;

class SpriteSystem extends System
{
    // Callback whenever we init a new sprite
    public var onSpriteAdded:SpriteComponent->Void;

    public function new(onSpriteAdded:SpriteComponent->Void = null)
    {
        super(["SpriteComponent"]);
        this.onSpriteAdded = onSpriteAdded;
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
        for (entity in this.entities)
        {
            var sprite:SpriteComponent = cast(entity.get("SpriteComponent"));
            if (sprite.image == null)
            {
                sprite.image = new FlxSprite();
                sprite.image.loadGraphic(sprite.imageFile);
                if (this.onSpriteAdded != null)
                {
                    this.onSpriteAdded(sprite);
                }
            }
        }
    }
}