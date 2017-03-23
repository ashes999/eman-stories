package deengames.emanstories.states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

class TitleState extends FlxState
{
    override public function create()
    {
        var newGameButton = new FlxButton(0, 0, "Label", function() {
            FlxG.switchState(new GenerateWorldState());
        });

        // Scale up and set font size appropriately
        newGameButton.scale.x = newGameButton.scale.y = 3;
        newGameButton.label.setFormat(null, 32);
        newGameButton.label.width *= 3;  
        this.add(newGameButton);
    }
}