package states.sites;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import flixel.FlxSprite;

class FlxSpriteState extends SwagState
{
	override public function create()
	{
		var coolBackdrop:FlxBackdrop = new FlxBackdrop(Paths.image('menubglol'), 0.2, 0, true, true);
		coolBackdrop.velocity.set(50, 30);
		coolBackdrop.alpha = 0.7;
		add(coolBackdrop);

		var titletext = new FlxText(0, 0, 0, "FlxSprites are just FlxObjects with the ability to show graphics.\n There are various ways to do this.\nHere's a snippet:\nvar player = new FlxSprite();\nplayer.loadGraphic('assets/images/player.png');\nadd(player);\n This loads the image 'player.png' from the 'assets/images' directory and displays it in your FlxState!\n I've also used the snippet below!", 64);
		titletext.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, FlxTextAlign.RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		titletext.screenCenter();
		add(titletext);

        var player:FlxSprite =  new FlxSprite(500,330);
        player.loadGraphic("assets/images/player.png");
		player.scale.set(0.4, 0.4);
		add(player);


		super.create();
	}

	override public function update(elapsed:Float)
	{
        if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.BACKSPACE)
            transitionState(new states.PlayState());
		super.update(elapsed);
	}
}
