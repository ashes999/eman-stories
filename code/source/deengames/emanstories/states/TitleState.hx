package deengames.emanstories.states;

import flixel.FlxG;
import flixel.FlxState;
import quasar.core.QuasarState;
import quasar.core.QuasarSprite;

class TitleState extends QuasarState
{
    override public function create()
    {
        super.create();
        
        this.addSprite("assets/images/ui/new-game-button.png")
            .onClick(function() {
                FlxG.switchState(new GenerateWorldState());
        });
    }
}