package states;

import utilities.Options;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class FlashingLightsMenu extends MusicBeatState
{
    override public function create()
    {
        #if android
	    addVirtualPad(NONE, A_B);
        #end
        super.create();

        var text = new FlxText(0,0,0,"Hey! Thank you for choosing The Shaggyverse\n Stuff may break!!!\nIf anything breaks, message VortexDev#2258 or Sebastian Elijah#4898\non Discord and tell us what broke.\n (For the Android port, contact Heropowerbrine#4019)\nP.S.: This mod contains flashing lights!\nPress A to enable them, or B to not.\n(Any key closes this menu)", 32);        text.font = Paths.font("vcr.ttf");
        text.screenCenter();
        text.setBorderStyle(OUTLINE, FlxColor.BLACK, 1.5, 1);
        add(text);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if(controls.ACCEPT)
            Options.setData(true, "flashingLights");
        else if(!controls.ACCEPT && controls.BACK)
            Options.setData(false, "flashingLights");

        if(controls.BACK)
            FlxG.switchState(new TitleState());
    }
}
