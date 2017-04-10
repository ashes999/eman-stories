package nucelus.ecs.components;

import flixel.FlxSprite;

class SpriteComponent extends Component
{
    public var imageFile(default, null):String = "";
    public var image:FlxSprite;

    public function new(imageFile:String, parent:BaseEntity)
    {
        super(parent);
        this.imageFile = imageFile;
    }
}