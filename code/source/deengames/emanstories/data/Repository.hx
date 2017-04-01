package deengames.emanstories.data;

import quasar.io.JsonParser;
import deengames.emanstories.model.Story;

class Repository
{
    // These are all JSON objects
    public var stories(default, null):Array<Story>;
    public var locationNames(default, null):Array<String>;
    public var locationThemes(default, null):Array<String>;

    public function new(storiesJson:String, locationJson:String):Void
    {
        this.stories = new Array<Story>();
        var archtypes:Array<Dynamic> = JsonParser.parse(storiesJson).archtypes;
        for (storyJson in archtypes)
        {
            this.stories.push(new Story(storyJson));
        }

        var locations = JsonParser.parse(locationJson);
        this.locationNames = locations.locations;
        this.locationThemes = locations.themes;
    }
}