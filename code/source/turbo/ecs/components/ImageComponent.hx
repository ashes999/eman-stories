package turbo.ecs.components;

import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import turbo.ecs.components.SpriteComponent;

class ImageComponent extends SpriteComponent
{
    public var image:String = "";
    
    // internal
    public var isRepeating:Bool;

    public function new(fileName:String,isRepeating:Bool = false, parent:Entity)
    {
        super(parent);
        this.image = fileName;
        this.isRepeating = isRepeating;

        if (this.isRepeating)
        {
            this.sprite = new FlxBackdrop(this.image) ;
        }
        else
        {
            this.sprite = new FlxSprite(0, 0, this.image);
        }
    }
}