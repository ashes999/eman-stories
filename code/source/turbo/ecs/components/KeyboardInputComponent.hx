package turbo.ecs.components;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import turbo.ecs.components.AbstractComponent;

class KeyboardInputComponent extends AbstractComponent
{
    public var moveSpeed(default, null):Int = 0; // pixels per second
    
    public function new(moveSpeed:Int, parent:Entity)
    {
        super(parent);
        this.moveSpeed = moveSpeed;
    }

    public function update(elapsedSeconds:Float):Void
    {
        if (parent.has<PositionComponent>(PositionComponent)())
        {
            var position:PositionComponent = parent.get(PositionComponent);        
                
            var dx:Float = 0;
            var dy:Float = 0;
            var movement:Float = component.moveSpeed * elapsed;
            
            if (isPressed(FlxKey.LEFT) || isPressed(FlxKey.A))
            {
                dx = -movement;
            }
            else if (isPressed(FlxKey.RIGHT) || isPressed(FlxKey.D))
            {
                dx = movement;
            }
                
            if (isPressed(FlxKey.UP) || isPressed(FlxKey.W))            
            {
                dy = -movement;
            }
            else if (isPressed(FlxKey.DOWN) || isPressed(FlxKey.S))
            {
                dy = movement;
            }
            
            position.x += dx;
            position.y += dy;
        }
    }
}