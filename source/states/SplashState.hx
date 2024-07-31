package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class SplashState extends SwagState {
	var arrowsexylogo:FlxSprite;
	var funnyText:FlxText;

	static public var titleStarted:Bool = false;
	var curWacky:String;
	private var ptc:FlxText;

	static public var optionsInitialized:Bool = false;
	static public var transitionsAllowed:Bool = false;

	var introTexts:Array<String> = [
		"Js lettin y'all know I ain't use chatGPT at all lol,\nold unused code goes crazy!"
	];

	private var timer:FlxTimer;

	override public function create() {
		FlxG.camera.bgColor = 0xFF000000;
		optionsInitialized = true;

		super.create();

		curWacky = FlxG.random.getObject(introTexts);
		trace(curWacky);

		if (!titleStarted) {
			arrowsexylogo = new FlxSprite().loadGraphic(Paths.image('haxeflixellogo'));
			arrowsexylogo.screenCenter();
			arrowsexylogo.scale.set(0.3, 0.3);
			arrowsexylogo.antialiasing = true;
			arrowsexylogo.alpha = 0;
			add(arrowsexylogo);

			funnyText = new FlxText(0, 0, 0, "Welcome to the HaxeFlixel basics by Ty (@YoPhlox on twitter)", 24);
			funnyText.setFormat(Paths.font('vcr.ttf'), 24, FlxColor.WHITE, CENTER);
			funnyText.screenCenter();
			funnyText.alpha = 0;
			add(funnyText);

			FlxTween.tween(arrowsexylogo, {y: arrowsexylogo.y - 35, alpha: 1}, 1, {
				ease: FlxEase.cubeOut,
				startDelay: 0.5
			});

			FlxTween.tween(funnyText, {y: funnyText.y + 35, alpha: 1}, 1, {
				ease: FlxEase.cubeOut,
				startDelay: 0.5,
				onComplete: function(twn:FlxTween) {
					FlxTween.tween(funnyText, {alpha: 0}, 1, {
						ease: FlxEase.cubeOut,
						startDelay: 1,
						onComplete: function(twn:FlxTween) {
							funnyText.text = curWacky;
							funnyText.screenCenter(null);
							FlxTween.tween(funnyText, {alpha: 1}, 1, {
								ease: FlxEase.cubeOut
							});
						}
					});
				}
			});
		}
		timer = new FlxTimer();
		timer.start(5.5, onTimerComplete, 3);
	}

	private function onTimerComplete(timer:FlxTimer):Void {
		transitionState(new PlayState());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
