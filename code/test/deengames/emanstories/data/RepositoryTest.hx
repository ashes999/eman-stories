package deengames.emanstories.data;

import deengames.emanstories.data.Repository;

import massive.munit.Assert;

class RepositoryTest 
{
    @Test
    public function constructorPopulatesStoriesFromJson():Void
    {
        var json = '{ "allergies": "cats" }';
        var actual = new Repository(json).stories;
        Assert.areEqual(actual.allergies, "cats");
    }
}