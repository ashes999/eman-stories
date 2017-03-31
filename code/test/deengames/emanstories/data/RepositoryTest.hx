package deengames.emanstories.data;

import haxe.PosInfos;
import deengames.emanstories.data.Repository;

import massive.munit.Assert;

class RepositoryTest 
{
    @Test
    public function constructorPopulatesDataFromJson():Void
    {
        var storiesJson = '{ "archtypes": [ { "summary": "unleash ancient weapon in time to save the world" } ] }';
        var locationsJson = '{ "locations": [ "mountains", "valley" ], "themes": [ "fire", "mysterious" ] }';
        
        var actual = new Repository(storiesJson, locationsJson);
        
        Assert.areEqual(actual.stories.archtypes[0].summary, "unleash ancient weapon in time to save the world");
        this.assertEqualStringArrays(actual.locationNames, ["mountains", "valley"]);
        this.assertEqualStringArrays(actual.locationThemes, ["fire", "mysterious"]);
    }

    private function assertEqualStringArrays(actuals:Array<String>, expecteds:Array<String>, ?info:PosInfos)
    {
        if (actuals.length != expecteds.length)
        {
            throw 'Actual length: ${actuals.length} instead of expected: ${expecteds.length}';
        }
        else
        {
            // Order DOES matter!
            for (i in 0 ... expecteds.length)
            {
                var expected = expecteds[i];
                var actual = actuals[i];

                if (expected != actual)
                {
                    Assert.fail('Expected ${expected} but got ${actual} for element ${i}', info);
                }
                else 
                {
                    Assert.areEqual(actual, expected);
                }
            }
        }
    }
}