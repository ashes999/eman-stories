package deengames.emanstories.data;

import quasar.io.JsonParser;

class Repository
{
    public var stories(default, null):Dynamic;

    public function new(storiesJson:String):Void
    {
        this.stories = JsonParser.parse(storiesJson);
    }
}