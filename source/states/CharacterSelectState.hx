package states;
import game.Conductor;
import ui.HealthIcon;
import game.Boyfriend;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.system.FlxSoundGroup;
import flixel.math.FlxPoint;
import openfl.geom.Point;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import flixel.util.FlxStringUtil;
 /**
 hey you fun commiting people, 
 i don't know about the rest of the mod but since this is basically 99% my code 
 i do not give you guys permission to grab this specific code and re-use it in your own mods without asking me first.
 the secondary dev, ben
*/

/**

	hi

**/

class CharacterInSelect
{
	public var names:Array<String>;
	public var polishedNames:Array<String>;

	public function new(names:Array<String>, polishedNames:Array<String>)
	{
		this.names = names;
		this.polishedNames = polishedNames;
	}
}
class CharacterSelectState extends MusicBeatState
{
	public var char:Boyfriend;
	public var current:Int = 0;
	public var curForm:Int = 0;
	public var characterText:FlxText;

	public var funnyIconMan:HealthIcon;

	var notestuffs:Array<String> = ['LEFT', 'DOWN', 'UP', 'RIGHT'];

	public var isDebug:Bool = false; //CHANGE THIS TO FALSE BEFORE YOU COMMIT RETARDS

	public var PressedTheFunny:Bool = false;

	var selectedCharacter:Bool = false;

	var currentSelectedCharacter:CharacterInSelect;

	var noteMsTexts:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();

	//it goes left,right,up,down
	
	public var characters:Array<CharacterInSelect> = 
	[
		new CharacterInSelect(['bf', 'bside_bf', 'postboybf', 'dbf', 'gametoonsbf'], ["Boyfriend\n (if bf is not the player it will use the default)", 'Bside BF', 'Cside BF', 'Dside BF', 'Player']),
		new CharacterInSelect(['green-shaggy', 'red-shaggy', 'blue-shaggy', 'yellow-shaggy', 'orangeshaggy', 'purple-shaggy', 'magenta-shaggy', 'white_shaggy', 'cyan_shaggy', 'brownshaggy', 'seb_shaggy', 'RonShag', 'SpurkShag'], ['Shaggy', 'Red Shaggy', 'Blue Shaggy', 'Yellow Shaggy', 'Orange Shaggy', 'Purple Shaggy', 'Magenta Shaggy', 'White Shaggy', 'Cyan Shaggy', 'Brown Shaggy', 'Sebs Shaggy', 'Rons Shaggy', 'Spurks Shaggy']),
		new CharacterInSelect(['dad', 'spooky', 'monster', 'pico', 'mom', 'senpai', 'senpai-angry', 'spirit', 'tankman'], ['Daddy Dearest', 'Skid And Pump', 'Lemon Monster', 'Pico', 'Mommy Mearest', 'Senpai', 'Mad Senpai', 'Spirit', 'Tankman'])


	];
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		Conductor.changeBPM(110);

		currentSelectedCharacter = characters[current];


		FlxG.save.data.unlockedcharacters = [true,true,true,true,true,true,true,true]; //unlock everyone hi

		var end:FlxSprite = new FlxSprite(0, 0);
		FlxG.sound.playMusic(Paths.music("optionsMenu"),1,true);
		add(end);
		
		//create stage
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('stageback'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('stagefront'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		add(stageFront);

		var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.image('stagecurtains'));
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
		stageCurtains.updateHitbox();
		stageCurtains.antialiasing = true;
		stageCurtains.scrollFactor.set(1.3, 1.3);
		stageCurtains.active = false;
		add(stageCurtains);

		FlxG.camera.zoom = 0.75;

		//create character
		char = new Boyfriend(FlxG.width / 2, FlxG.height / 2, "bf");
		char.screenCenter();
		char.y = 450;
		add(char);
		
		characterText = new FlxText((FlxG.width / 9) - 50, (FlxG.height / 8) - 225, "Boyfriend");
		characterText.font = 'Comic Sans MS Bold';
		characterText.setFormat(Paths.font("comic.ttf"), 90, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		characterText.autoSize = false;
		characterText.fieldWidth = 1080;
		characterText.borderSize = 7;
		characterText.screenCenter(X);
		add(characterText);

		funnyIconMan = new HealthIcon('bf', true);
		funnyIconMan.sprTracker = characterText;
		funnyIconMan.visible = false;
		add(funnyIconMan);

		var tutorialThing:FlxSprite = new FlxSprite(-100, -100).loadGraphic(Paths.image('charSelectGuide'));
		tutorialThing.setGraphicSize(Std.int(tutorialThing.width * 1.5));
		tutorialThing.antialiasing = true;
		add(tutorialThing);
	}

	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		//FlxG.camera.focusOn(FlxG.ce);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			LoadingState.loadAndSwitchState(new MainMenuState());
		}


		if(controls.UP_P && !PressedTheFunny)
		{
			char.playAnim('singUP', true);
		}
		if(controls.DOWN_P && !PressedTheFunny)
		{
			char.playAnim('singDOWN', true);
		}
		if (controls.ACCEPT)
		{
			if (PressedTheFunny)
			{
				return;
			}
			else
			{
				PressedTheFunny = true;
			}
			selectedCharacter = true;
			var heyAnimation:Bool = char.animation.getByName("hey") != null; 
			char.playAnim(heyAnimation ? 'hey' : 'singUP', true);
			FlxG.sound.music.stop();
			LoadingState.loadAndSwitchState(new PlayState());

		}
		if (FlxG.keys.justPressed.LEFT && !selectedCharacter)
		{
			curForm = 0;
			current--;
			if (current < 0)
			{
				current = characters.length - 1;
			}
			UpdateBF();
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		}

		if (FlxG.keys.justPressed.RIGHT && !selectedCharacter)
		{
			curForm = 0;
			current++;
			if (current > characters.length - 1)
			{
				current = 0;
			}
			UpdateBF();
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		}
		if (FlxG.keys.justPressed.DOWN && !selectedCharacter)
		{
			curForm--;
			if (curForm < 0)
			{
				curForm = characters[current].names.length - 1;
			}
			UpdateBF();
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		}

		if (FlxG.keys.justPressed.UP && !selectedCharacter)
		{
			curForm++;
			if (curForm > characters[current].names.length - 1)
			{
				curForm = 0;
			}
			UpdateBF();
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		}
	}

	public function UpdateBF()
	{
		funnyIconMan.color = FlxColor.WHITE;
		currentSelectedCharacter = characters[current];
		characterText.text = currentSelectedCharacter.polishedNames[curForm];
		char.destroy();
		char = new Boyfriend(FlxG.width / 2, FlxG.height / 2, currentSelectedCharacter.names[curForm]);
		char.screenCenter();
		char.y = 450;

		switch (char.curCharacter)
		{
			case 'bf' | 'bside_bf' | 'dbf' | 'gametoonsbf' | 'postboybf':
				//dont do anything
			default: char.y = 100;
		}
		add(char);
		funnyIconMan.animation.play(char.curCharacter);
		characterText.screenCenter(X);
	}

	override function beatHit()
	{
		super.beatHit();
		if (char != null && !selectedCharacter)
		{
			char.playAnim('idle');
		}
	}
}