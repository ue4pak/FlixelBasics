package states.sites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Http;
import haxe.Json;
import haxe.ds.StringMap;

class IPState extends SwagState
{
    var infoTexts:Array<FlxText> = [];

    override public function create()
    {
        super.create();

        var jumpscare:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('simplejump'));
        jumpscare.scrollFactor.x = 0;
        jumpscare.scrollFactor.y = 0.18;
        jumpscare.setGraphicSize(Std.int(jumpscare.width * 0.65));
        jumpscare.updateHitbox();
        jumpscare.screenCenter();
        jumpscare.antialiasing = true;
        add(jumpscare);

        fetchIP();
    }

    function fetchIP()
    {
        var http = new Http("http://ip-api.com/json/");
        http.onData = function(data:String)
        {
            var json = Json.parse(data);
            displayInfo(json);
        }
        http.onError = function(error:String)
        {
            var errorText = new FlxText(FlxG.width - 500, Std.int(FlxG.height / 2 - 50), 0, "Error fetching IP");
            errorText.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE, "left");
            add(errorText);
        }
        http.request();
    }

    function displayInfo(json:Dynamic)
    {
        var yPosition:Int = Std.int(FlxG.height / 2 - 150);
        var fields:Array<String> = [
            "query", "country", "countryCode", "regionName",
            "city", "lat", "lon"
        ];

        for (field in fields)
        {
            var value:String = Reflect.field(json, field);
            var text:FlxText = new FlxText(FlxG.width - 500, yPosition, 0, field + ": " + value);
            text.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "left");
            add(text);
            infoTexts.push(text);
            yPosition += 30;
        }
    }

    override public function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.BACKSPACE)
            transitionState(new states.PlayState());
        super.update(elapsed);
    }
}
