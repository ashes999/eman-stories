package;

import openfl.display.Sprite;
import flixel.FlxGame;
import deengames.emanstories.states.TitleState;
import deengames.emanstories.states.EcsTestState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, EcsTestState, 1, 60, 60, true));
	}
}
