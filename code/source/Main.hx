package;

import flixel.FlxGame;
import deengames.emanstories.states.TitleState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, TitleState, 1, 60, 60, true));
	}
}
