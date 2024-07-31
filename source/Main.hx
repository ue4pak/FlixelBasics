package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.SplashState;

class Main extends Sprite
{
	var config = {
		width: 1280,
		height: 720,
		zoom: -1.0, 
		#if !html
		framerate: 60,
		#else
		framerate: 30,
		#end
		initialState: SplashState, 
		skipSplash: true,
		startFullscreen: false
	};

	public function new()
	{
		super();
		addChild(new FlxGame(config.width, config.height, config.initialState, #if (flixel < "5.0.0") config.zoom, #end config.framerate, config.framerate,
			config.skipSplash, config.startFullscreen));
	}
}
