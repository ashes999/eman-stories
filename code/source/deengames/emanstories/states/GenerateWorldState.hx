package deengames.emanstories.states;

import flixel.FlxG;
import flixel.text.FlxText;
import quasar.core.QuasarState;
import deengames.emanstories.model.World;
import deengames.emanstories.data.Repository;

class GenerateWorldState extends QuasarState
{    
    private static inline var SEED_FOR_TESTING:Int = 1;
    
    private var statusText:FlxText;

    override public function create()
    {
        super.create();

        var repository = new Repository(
            openfl.Assets.getText("assets/data/stories.json"), openfl.Assets.getText("assets/data/locations.json")
        );

        var world = new World(repository, SEED_FOR_TESTING);
        
        this.statusText = new FlxText(0, 0, "", 32);
        this.statusText.text = 'Generating world ${world.seed} ...';
        this.statusText.x = (this.width - this.statusText.width) / 2;
        this.statusText.y = (this.height - this.statusText.height) / 2;
        add(this.statusText);

        this.after(1, function() {
            FlxG.switchState(new AreaMapState());
        });
    }
}