package android;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

class FlxHitbox extends FlxSpriteGroup {
    public var hitbox:FlxSpriteGroup;

    public var array:Array<FlxButton> = [];

    public var K1:FlxButton;
    public var K2:FlxButton;
    public var K3:FlxButton;
    public var K4:FlxButton;
    public var K5:FlxButton;
    public var K6:FlxButton;
    public var K7:FlxButton;
    public var K8:FlxButton;
    public var K9:FlxButton;
    public var K10:FlxButton;
    public var K11:FlxButton;
    public var K12:FlxButton;
    public var K13:FlxButton;
    public var K14:FlxButton;
    public var K15:FlxButton;
    public var K16:FlxButton;
    public var K17:FlxButton;
    public var K18:FlxButton;
    public var K19:FlxButton;
    public var K20:FlxButton;
    public var K21:FlxButton;

    public var orgType:HitboxType = FOUR;
    public var orgAlpha:Float = 0.75;
    public var orgAntialiasing:Bool = true;
    
    public function new(type:HitboxType = FOUR, ?alphaAlt:Float = 0.75, ?antialiasingAlt:Bool = true)
    {
        super();

	orgType = type;
	orgAlpha = alphaAlt;
	orgAntialiasing = antialiasingAlt;

        hitbox = new FlxSpriteGroup();
        hitbox.scrollFactor.set();

        K1 = new FlxButton(0, 0);
        K2 = new FlxButton(0, 0);
        K3 = new FlxButton(0, 0);
        K4 = new FlxButton(0, 0);
        K5 = new FlxButton(0, 0);
        K6 = new FlxButton(0, 0);
        K7 = new FlxButton(0, 0);
        K8 = new FlxButton(0, 0);
        K9 = new FlxButton(0, 0);
        K10 = new FlxButton(0, 0);
        K11 = new FlxButton(0, 0);
        K12 = new FlxButton(0, 0);
        K13 = new FlxButton(0, 0);
        K14 = new FlxButton(0, 0);
        K15 = new FlxButton(0, 0);
        K16 = new FlxButton(0, 0);
        K17 = new FlxButton(0, 0);
        K18 = new FlxButton(0, 0);
        K19 = new FlxButton(0, 0);
        K20 = new FlxButton(0, 0);
        K21 = new FlxButton(0, 0);

        var hitbox_hint:FlxSprite = new FlxSprite(0, 0);

        switch (type)
        {
            case ONE:
                hitbox_hint.loadGraphic(Paths.image('android/1k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
            case TWO:
                hitbox_hint.loadGraphic(Paths.image('android/2k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(640, 0, "K2")));
            case THREE:
                hitbox_hint.loadGraphic(Paths.image('android/3k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(426, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(852, 0, "K3")));
            case FOUR:
                hitbox_hint.loadGraphic(Paths.image('android/4k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(320, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(640, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(960, 0, "K4")));
            case FIVE:
                hitbox_hint.loadGraphic(Paths.image('android/5k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(256, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(512, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(768, 0, "K4")));
                hitbox.add(add(K5 = createhitbox(1024, 0, "K5"))); 
            case SIX:
                hitbox_hint.loadGraphic(Paths.image('android/6k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(213, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(426, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(639, 0, "K4")));
                hitbox.add(add(K5 = createhitbox(852, 0, "K5")));
                hitbox.add(add(K6 = createhitbox(1065, 0, "K6")));
            case SEVEN:
                hitbox_hint.loadGraphic(Paths.image('android/7k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(182, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(364, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(546, 0, "K4")));
                hitbox.add(add(K5 = createhitbox(728, 0, "K5")));
                hitbox.add(add(K6 = createhitbox(910, 0, "K6")));
                hitbox.add(add(K7 = createhitbox(1092, 0, "K7")));
            case EIGHT:
                hitbox_hint.loadGraphic(Paths.image('android/8k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(160, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(320, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(480, 0, "K4")));
                hitbox.add(add(K5 = createhitbox(640, 0, "K5")));
                hitbox.add(add(K6 = createhitbox(800, 0, "K6")));
                hitbox.add(add(K7 = createhitbox(960, 0, "K7")));
                hitbox.add(add(K8 = createhitbox(1120, 0, "K8")));
            case NINE:
                hitbox_hint.loadGraphic(Paths.image('android/9k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(142, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(284, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(426, 0, "K4")));
                hitbox.add(add(K5 = createhitbox(568, 0, "K5")));
                hitbox.add(add(K6 = createhitbox(710, 0, "K6")));
                hitbox.add(add(K7 = createhitbox(852, 0, "K7")));
                hitbox.add(add(K8 = createhitbox(994, 0, "K8")));
                hitbox.add(add(K9 = createhitbox(1136, 0, "K9")));
            case TEN:
                hitbox_hint.loadGraphic(Paths.image('android/10k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(128, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(256, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(384, 0, "K4")));    
                hitbox.add(add(K5 = createhitbox(512, 0, "K5")));
                hitbox.add(add(K6 = createhitbox(640, 0, "K6"))); 
                hitbox.add(add(K7 = createhitbox(768, 0, "K7")));
                hitbox.add(add(K8 = createhitbox(896, 0, "K8"))); 
                hitbox.add(add(K9 = createhitbox(1024, 0, "K9")));
                hitbox.add(add(K10 = createhitbox(1152, 0, "K10")));
            case ELEVEN:
                hitbox_hint.loadGraphic(Paths.image('android/11k_hint'));

                hitbox.add(add(K1 = createhitbox(0, 0, "K1")));
                hitbox.add(add(K2 = createhitbox(116, 0, "K2")));
                hitbox.add(add(K3 = createhitbox(232, 0, "K3")));
                hitbox.add(add(K4 = createhitbox(348, 0, "K4")));    
                hitbox.add(add(K5 = createhitbox(464, 0, "K5")));
                hitbox.add(add(K6 = createhitbox(580, 0, "K6"))); 
                hitbox.add(add(K7 = createhitbox(696, 0, "K7")));
                hitbox.add(add(K8 = createhitbox(812, 0, "K8"))); 
                hitbox.add(add(K9 = createhitbox(928, 0, "K9")));
                hitbox.add(add(K10 = createhitbox(1044, 0, "K10"))); 
                hitbox.add(add(K11 = createhitbox(1160, 0, "K11")));
	    case TWELVE:
                hitbox_hint.loadGraphic(Paths.image('android/12k_hint'));
                
                hitbox.add(add(K1 = createhitbox(0, "K1"))); 
                hitbox.add(add(K2 = createhitbox(106, "K2")));
                hitbox.add(add(K3 = createhitbox(212, "K3"))); 
                hitbox.add(add(K4 = createhitbox(318, "K4")));
                hitbox.add(add(K5 = createhitbox(424, "K5"))); 
                hitbox.add(add(K6 = createhitbox(530, "K6")));
                hitbox.add(add(K7 = createhitbox(636, "K7")));
                hitbox.add(add(K8 = createhitbox(742, "K8")));
                hitbox.add(add(K9 = createhitbox(848, "K9")));
                hitbox.add(add(K10 = createhitbox(954, "K10")));
                hitbox.add(add(K11 = createhitbox(1060, "K11"))); 
                hitbox.add(add(K12 = createhitbox(1166, "K12")));
	    case THIRTEEN:
                hitbox_hint.loadGraphic(Paths.image('android/hitbox13k_hint'));
                
                hitbox.add(add(K1 = createhitbox(0, "K1"))); 
                hitbox.add(add(K2 = createhitbox(98, "K2")));
                hitbox.add(add(K3 = createhitbox(196, "K3"))); 
                hitbox.add(add(K4 = createhitbox(294, "K4")));
                hitbox.add(add(K5 = createhitbox(392, "K5"))); 
                hitbox.add(add(K6 = createhitbox(490, "K6")));
                hitbox.add(add(K7 = createhitbox(588, "K7")));
                hitbox.add(add(K8 = createhitbox(686, "K8")));
                hitbox.add(add(K9 = createhitbox(784, "K9")));
                hitbox.add(add(K10 = createhitbox(882, "K10")));
                hitbox.add(add(K11 = createhitbox(980, "K11"))); 
                hitbox.add(add(K12 = createhitbox(1078, "K12")));
                hitbox.add(add(K13 = createhitbox(1176, "K13")));
	    case FOURTEEN:
                hitbox_hint.loadGraphic(Paths.image('android/14k_hint'));
                
                hitbox.add(add(K1 = createhitbox(0, "K1"))); 
                hitbox.add(add(K2 = createhitbox(91, "K2")));
                hitbox.add(add(K3 = createhitbox(182, "K3"))); 
                hitbox.add(add(K4 = createhitbox(273, "K4")));
                hitbox.add(add(K5 = createhitbox(364, "K5"))); 
                hitbox.add(add(K6 = createhitbox(455, "K6")));
                hitbox.add(add(K7 = createhitbox(546, "K7")));
                hitbox.add(add(K8 = createhitbox(637, "K8")));
                hitbox.add(add(K9 = createhitbox(728, "K9")));
                hitbox.add(add(K10 = createhitbox(819, "K10")));
                hitbox.add(add(K11 = createhitbox(910, "K11"))); 
                hitbox.add(add(K12 = createhitbox(1001, "K12")));
                hitbox.add(add(K13 = createhitbox(1092, "K13")));
		hitbox.add(add(K14 = createhitbox(1183, "K14")));
	    case FIFTEEN:
                hitbox_hint.loadGraphic(Paths.image('android/15k_hint'));
                
                hitbox.add(add(K1 = createhitbox(0, "K1"))); 
                hitbox.add(add(K2 = createhitbox(85, "K2")));
                hitbox.add(add(K3 = createhitbox(170, "K3"))); 
                hitbox.add(add(K4 = createhitbox(255, "K4")));
                hitbox.add(add(K5 = createhitbox(340, "K5"))); 
                hitbox.add(add(K6 = createhitbox(425, "K6")));
                hitbox.add(add(K7 = createhitbox(510, "K7")));
                hitbox.add(add(K8 = createhitbox(595, "K8")));
                hitbox.add(add(K9 = createhitbox(680, "K9")));
                hitbox.add(add(K10 = createhitbox(765, "K10")));
                hitbox.add(add(K11 = createhitbox(850, "K11"))); 
                hitbox.add(add(K12 = createhitbox(935, "K12")));
                hitbox.add(add(K13 = createhitbox(1020, "K13")));
                hitbox.add(add(K14 = createhitbox(1105, "K14"))); 
                hitbox.add(add(K15 = createhitbox(1190, "K15")));
	    case SIXTEEN:
                hitbox_hint.loadGraphic(Paths.image('android/hitbox16k_hint'));
                
                hitbox.add(add(K1 = createhitbox(0, "K1"))); 
                hitbox.add(add(K2 = createhitbox(80, "K2")));
                hitbox.add(add(K3 = createhitbox(160, "K3"))); 
                hitbox.add(add(K4 = createhitbox(240, "K4")));
                hitbox.add(add(K5 = createhitbox(320, "K5"))); 
                hitbox.add(add(K6 = createhitbox(400, "K6")));
                hitbox.add(add(K7 = createhitbox(480, "K7")));
                hitbox.add(add(K8 = createhitbox(560, "K8")));
                hitbox.add(add(K9 = createhitbox(640, "K9")));
                hitbox.add(add(K10 = createhitbox(720, "K10")));
                hitbox.add(add(K11 = createhitbox(800, "K11"))); 
                hitbox.add(add(K12 = createhitbox(880, "K12")));
                hitbox.add(add(K13 = createhitbox(960, "K13")));
                hitbox.add(add(K14 = createhitbox(1040, "K14"))); 
                hitbox.add(add(K15 = createhitbox(1120, "K15")));
                hitbox.add(add(K16 = createhitbox(1200, "K16"))); 
        }

        array = [K1, K2, K3, K4, K5, K6, K7, K8, K9, K10, K11, K12, K13, K14, K15, K16, K17, K18, K19, K20, K21];

	hitbox_hint.antialiasing = orgAntialiasing;
	hitbox_hint.alpha = orgAlpha;
	add(hitbox_hint);
    }

    public function createhitbox(x:Float = 0, y:Float = 0, frames:String) {
	var button = new FlxButton(x, y);
	button.loadGraphic(FlxGraphic.fromFrame(getFrames().getByName(frames)));
	button.antialiasing = orgAntialiasing;
	button.alpha = 0;// sorry but I can't hard lock the hitbox alpha
	button.onDown.callback = function (){FlxTween.num(0, 0.75, 0.075, {ease:FlxEase.circInOut}, function(alpha:Float){ button.alpha = alpha;});};
	button.onUp.callback = function (){FlxTween.num(0.75, 0, 0.1, {ease:FlxEase.circInOut}, function(alpha:Float){ button.alpha = alpha;});}
	button.onOut.callback = function (){FlxTween.num(button.alpha, 0, 0.2, {ease:FlxEase.circInOut}, function(alpha:Float){ button.alpha = alpha;});}
	return button;
    }

    public function getFrames():FlxAtlasFrames {
        return switch (orgType)
        {
            case ONE:
                Paths.getSparrowAtlas('android/1k');
            case TWO:
                Paths.getSparrowAtlas('android/2k');
            case THREE:
                Paths.getSparrowAtlas('android/3k');
            case FOUR:
                Paths.getSparrowAtlas('android/4k');
            case FIVE:
                Paths.getSparrowAtlas('android/5k');
            case SIX:
                Paths.getSparrowAtlas('android/6k');
            case SEVEN:
                Paths.getSparrowAtlas('android/7k');
            case EIGHT:
                Paths.getSparrowAtlas('android/8k');
            case NINE:
                Paths.getSparrowAtlas('android/9k');
            case TEN:
                Paths.getSparrowAtlas('android/10k');
            case ELEVEN:
                Paths.getSparrowAtlas('android/11k');
	    case TWELVE:
		Paths.getSparrowAtlas('android/12k');
	    case THIRTEEN:
		Paths.getSparrowAtlas('android/hitbox13k');
	    case FOURTEEN:
		Paths.getSparrowAtlas('android/14k');
	    case FIFTEEN:
		Paths.getSparrowAtlas('android/15k');
	    case SIXTEEN:
		Paths.getSparrowAtlas('android/hitbox16k');
        }
    }

    override public function destroy():Void
    {
            super.destroy();

            K1 = null;
            K2 = null;
            K3 = null;
            K4 = null;
            K5 = null;
            K6 = null;
            K7 = null;
            K8 = null;
            K9 = null;
            K10 = null;
            K11 = null;
            K12 = null;
            K13 = null;
            K14 = null;
            K15 = null;
            K16 = null;
            K17 = null;
            K18 = null;
            K19 = null;
            K20 = null;
            K21 = null;
    }
}

enum HitboxType {
    ONE;
    TWO;
    THREE;
    FOUR;
    FIVE;
    SIX;
    SEVEN;
    EIGHT;
    NINE;
    TEN;
    ELEVEN;
    TWELVE;
    THIRTEEN;
    FOURTEEN;
    FIFTEEN;
    SIXTEEN;
}
