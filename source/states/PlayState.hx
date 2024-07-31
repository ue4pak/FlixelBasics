package states;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;

class PlayState extends SwagState
{
	override public function create()
	{
		var coolBackdrop:FlxBackdrop = new FlxBackdrop(Paths.image('menubglol'), 0.2, 0, true, true);
		coolBackdrop.velocity.set(50, 30);
		coolBackdrop.alpha = 0.7;
		add(coolBackdrop);

		var titletext = new FlxText(0, 0, 0, "\nHey all, Ty here. \nThis project is to show simple basics of HaxeFlixel. \nPress 1 for the FlxSprite basics. \nPress 2 for FlxText basics. \nPress 3 for FlxG.sound.playMusic basics \n Press 4 to see the source on Github! \nPress 5 to show your ip (made by me with an api lol)", 64);
		titletext.setFormat(Paths.font('vcr.ttf'), 22, FlxColor.WHITE, FlxTextAlign.RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		titletext.screenCenter();
		add(titletext);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ONE)
		{
			transitionState(new states.sites.FlxSpriteState());
		}
		else if (FlxG.keys.justPressed.TWO)
		{
			transitionState(new states.sites.FlxTextState());
		}
		else if (FlxG.keys.justPressed.THREE)
		{
			transitionState(new states.sites.FlxGMusicState());
		}
		else if (FlxG.keys.justPressed.THREE)
		{
			FlxG.openURL('https://github.com/ue4pak/FlixelBasicsScholarsAdvantage');

		}
		else if (FlxG.keys.justPressed.FIVE)
		{
			transitionState(new states.sites.IPState());
		}
		super.update(elapsed);
	}
}
