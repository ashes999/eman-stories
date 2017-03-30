package deengames.emanstories.model.story;

class Story
{
    // Internal: only for gamedev purposes
    public var summary(default, null):String;
    public var majorEvents(default, null):Array<String>;
    public var plotTwistOptions(default, null):Array<String>;

    public function new()
    {
        // For now, generate a hard-coded story. For later, generate a bunch of these through JSON data,
        // pick one at random, bada-bing, bada-boom.

        this.summary = "An evil antagonist captures your parent, and races from dungeon to dungeon. You follow, determined to save them.";

        // Analysis: this is mostly in-game events, plus locations/people
        this.majorEvents = [
            // Turn into data objects of some sort.
            // Confront atagonist has sub-flavours, eg. he taunts you vs. he says you are growing in power
            "Evil {antagonist} captures {person 1} at {town} and runs", // intro
            "Confront antagonist at {location 1}",
            "Confront antagonist at {location 2}", // you are growing in power ...
            "Final confrontation at {location 3 (epic)}", // he tricks you into unlocking the treasure
            "Unlock {beast}" // final battle, plus or minus variation
        ];

        this.plotTwistOptions = [
            "{person 1} sacrifices themselves for you", // as only a parent would
            "{person 1} escapes", // battle together
            "{person 1} passes {skill (epic)} to you" // in-game skill, eg. 1000 slashes
        ];

        // Now we know: we need an antagonist, friend/family member, two locations, one epic location
        // for our final battle (eg. cliff overhang, crystal forest, floating island),
        // a final-boss creature, and possibly a new skill.

        // We also know the key events that will take place, and have a good idea of the actual
        // in-game events (eg. what the antagonist will say or do, or what will happen).
    }
}