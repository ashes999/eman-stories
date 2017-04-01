package deengames.emanstories.model;

class Story
{
    public var summary(default, null):String;
    public var locations(default, null):Array<String>;

    public function new(json:Dynamic)
    {
        this.summary = json.summary;
        this.locations = new Array<String>();

        var majorEvents:Array<String> = json.majorEvents;

        for (event in majorEvents)
        {
            var rawEvent = event;
            while (rawEvent.indexOf("{location") > -1)
            {
                var start = rawEvent.indexOf("{location");
                var stop = rawEvent.indexOf("}", start);
                var location = rawEvent.substr(start, stop);
                rawEvent = '${rawEvent.substr(0, start)}${rawEvent.substr(stop + 1)}';
                if (this.locations.indexOf(location) == -1)
                {
                    this.locations.push(location);
                }
            }
        }
    }
}