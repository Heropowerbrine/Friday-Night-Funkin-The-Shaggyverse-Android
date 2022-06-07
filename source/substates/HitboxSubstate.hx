package substates;

import android.flixel.FlxHitbox;
import states.PlayState;
import states.MusicBeatState;
import substates.MusicBeatSubstate;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxColor;

class HitboxSubstate extends MusicBeatSubstate
{ 
   public function new()
  {
       var ogPlayerKeyCount = PlayState.instance.ogPlayerKeyCount;
       var _hitbox = FlxHitbox;
       super();
  }

  public function addHitbox(ogPlayerKeyCount:Int) {               
		var curhitbox:HitboxType = FOUR;

		switch (ogPlayerKeyCount){
			case 1:
				curhitbox = ONE;
			case 2:
				curhitbox = TWO;
			case 3:
				curhitbox = THREE;					
			case 4:
				curhitbox = FOUR;	
			case 5:
				curhitbox = FIVE;
			case 6:
				curhitbox = SIX;
			case 7:
				curhitbox = SEVEN;
			case 8:
				curhitbox = EIGHT;
			case 9:
				curhitbox = NINE;
			case 10:
				curhitbox = TEN;
		        case 11:
				curhitbox = ELEVEN;	
			case 12:
				curhitbox = TWELVE;
			case 13:
				curhitbox = THIRTEEN;
			case 14:
				curhitbox = FOURTEEN;
			case 15:
				curhitbox = FIFTEEN;
			case 16:
				curhitbox = SIXTEEN;
			case 17:
				curhitbox = SEVENTEEN;
			case 18:
				curhitbox = EIGHTEEN;
			case 19:
				curhitbox = NINETEEN;
			case 20:
				curhitbox = TWENTY;
			case 21:
				curhitbox = TWENTYONE;
			default:
				curhitbox = FOUR;
		}

		_hitbox = new FlxHitbox(curhitbox);

		var camcontrol = new flixel.FlxCamera();
		FlxG.cameras.add(camcontrol);
		camcontrol.bgColor.alpha = 0;
		_hitbox.cameras = [camcontrol];

		_hitbox.visible = false;
		add(_hitbox);
   }  

   override function update(elapsed:Float)
  {
   if(PlayState.startedCountdown = true)
     addHitbox(ogPlayerKeyCount);
     _hitbox.visible = true;
   super.update(elapsed);
  }
}
