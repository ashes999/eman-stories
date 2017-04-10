package turbo.ecs.components;

import flixel.input.mouse.FlxMouseEventManager;
import flixel.FlxObject;
import turbo.ecs.components.AbstractComponent;

class MouseClickComponent extends AbstractComponent
{
    private var mouseDownCallback:Void->Void;
    private var mouseUpCallback:Void->Void;
    
    public function new(onMouseDown:Void->Void, onMouseUp:Void->Void = null, parent:Entity)
    {
        super(parent);
        if (parent.has(ImageComponent))
        {
            var image = parent.get<ImageComponent>(ImageComponent);
            FlxMouseEventManager.add(image.sprite, this.mouseDown, this.mouseUp);
        }
        else if (parent.has(ColourComponent))
        {
            var colour = parent.get<ColourComponent>(ColourComponent);
            FlxMouseEventManager.add(colour.sprite, this.mouseDown, this.mouseUp);
        }
        else
        {
            throw "Can't add mouse-click component without an image or colour!";
        }
    }

    private function mouseDown(obj:FlxObject):Void
    {
        if (this.mouseDownCallback != null)
        {
            this.mouseDownCallback();
        }
    }

    private function onMouseUp(obj:FlxObject):Void
    {
        if (this.mouseUpCallback != null)
        {
            this.mouseUpCallback();
        }
    }
}