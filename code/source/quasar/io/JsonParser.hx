package quasar.io;

import openfl.Assets;

// static class
class JsonParser
{
    private function new() {}

    /**
    Parses a JSON file and returns it as a dynamic object. Removes comments.
    eg. if you pass in the string { "x": 1 }, you can type rVal.x to get "1"
    **/
    public static function parse(assetFileName:String):Dynamic
    {
        var text = Assets.getText(assetFileName);
        
        // Remove comments
        var commentsRegex = new EReg("//.*", "g"); // g => global / match-all
        text = commentsRegex.replace(text, ""); // replace //.* with ""
        
        var json:Dynamic = haxe.Json.parse(text);
        return json;
    }
}