package deengames.emanstories.data;

import quasar.io.JsonParser;

class Repository
{
    // These are all JSON objects
    public var stories(default, null):Dynamic;
    public var locationNames(default, null):Array<String>;
    public var locationThemes(default, null):Array<String>;

    public function new(storiesJson:String, locationJson:String):Void
    {
        this.stories = JsonParser.parse(storiesJson);
        
        var locations = JsonParser.parse(locationJson);
        this.locationNames = locations.locations;
        this.locationThemes = locations.themes;
    }
}