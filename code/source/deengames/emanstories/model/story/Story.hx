package deengames.emanstories.model.story;

class Story
{
    public var summary(default, null):String;
    public var majorEvents = new Array<String>();
    public var plotTwistOptions = new Array<String>();

    public function new()
    {
        // For now, generate a hard-coded story. For later, generate a bunch of these through JSON data,
        // pick one at random, bada-bing, bada-boom.

        this.summary = "An evil antagonist captures your family person, and races towards some location. 
            You follow, determined to save them ...";

        // Analysis: this is mostly in-game events, plus locations/people
        this.majorEvents = [
            // Turn into data objects of some sort.
            // Confront atagonist has sub-flavours, eg. he taunts you vs. he says you are growing in power
            "Evil {antagonist} captures {friend} and runs", // intro
            "Confront antagonist at {location 1}, who taunts", // encounter/area 1
            "Confront antagonist at {location 2}, who appreciates", // you are growing in power ...
            "Final confrontation at {epic location}" // he's determined to beat you
        ];

        // Analysis: this is mostly in-game events, plus an item or person, plus boss battle
        // Option 1: final boss is antagonist, with the generated item
        // Option 2: final boss is generated creature
        // Option 3: final boss is generated creature
        // Sounds like plot twists are "configuration" for who the boss is
        // Pick one
        this.plotTwistOptions = [
            "Unlock ultimate weapon {item}", // for world domination
            "Unleash ancient evil {creature}", // ancient villian back to kill you all
            "Ancient evil {creature} rising" // face it together
        ];

        // Now we know: we need an antagonist, friend/family member, two locations, one epic location
        // for our final battle (eg. cliff overhang, crystal forest, floating island),
        // and either an item or a creature (depending on the plot twist). And that's our final boss.

        // We also know the key events that will take place, and have a good idea of the actual
        // in-game events (eg. what the antagonist will say or do, or what will happen).
    }
}