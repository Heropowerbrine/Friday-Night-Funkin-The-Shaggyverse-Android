package substates;

import android.flixel.FlxHitbox;
import states.PlayState;
import states.MusicBeatState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxColor;

class HitboxSubstate extends MusicBeatSubstate && MusicBeatState
{ 
  public function new
  {
    super();
  }
  
  override public function create()
  {
   var ogPlayerKeyCount = PlayState.ogPlayerKeyCount
   if(PlayState.startedCountdown = true)
     addHitbox(ogPlayerKeyCount);
     _hitbox.visible = true;
   super.create();
  }
}
