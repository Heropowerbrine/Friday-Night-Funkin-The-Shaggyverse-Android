/*package substates;

import android.flixel.FlxHitbox;
import states.PlayState;
import states.MusicBeatState;
import substates.MusicBeatSubstate;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxUIState;
import flixel.input.actions.FlxActionInput;

class HitboxSubstate extends MusicBeatSubstate
{ 
    var ogPlayerKeyCount = PlayState.instance.ogPlayerKeyCount;
    var _hitbox = FlxHitbox;
    var addHitbox = MusicBeatState.addHitbox;
   
    public function new()
   {
        super();
   }

    override function update(elapsed:Float)
   {
    if(PlayState.startedCountdown = true)
      addHitbox(ogPlayerKeyCount);
      MusicBeatState._hitbox.visible = true;
    super.update(elapsed);
   }
}
*/
