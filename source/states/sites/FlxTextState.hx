package states.sites;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import flixel.FlxSprite;

class FlxTextState extends SwagState
{
	override public function create()
	{
		var coolBackdrop:FlxBackdrop = new FlxBackdrop(Paths.image('menubglol'), 0.2, 0, true, true);
		coolBackdrop.velocity.set(50, 30);
		coolBackdrop.alpha = 0.7;
		add(coolBackdrop);

		var titletext = new FlxText(0, 0, 0, "FlxText is as simple as this (SNIPPET):\n 		
        var flxtextname = new FlxText(0, 0, 0, 'Whatever you wanna display here', 64);\n 		
		flxtextname.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, FlxTextAlign.RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);\n 		
		flxtextname.screenCenter();\n 		
		add(flxtextname);" , 64);
		titletext.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, FlxTextAlign.RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		titletext.screenCenter();
		add(titletext);


		super.create();
	}

	override public function update(elapsed:Float)
	{
        if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.BACKSPACE)
            transitionState(new states.PlayState());
		super.update(elapsed);
	}
}
