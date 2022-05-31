package states;

#if desktop
import cpp.abi.Abi;
#end
import flixel.graphics.FlxGraphic;
import flixel.FlxCamera;
import flixel.addons.plugin.taskManager.FlxTask;
import flixel.group.FlxSpriteGroup;
import flixel.addons.ui.FlxUIGroup;
import flixel.ui.FlxButton;
import flixel.FlxObject;
import flixel.FlxBasic;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.ColorTween;
import flixel.util.FlxStringUtil;
import lime.utils.Assets;
#if discord_rpc
import utilities.Discord.DiscordClient;
#end
using StringTools;
/*
hi cool lil committers looking at this code, 95% of this is my code and I'd appreciate if you didn't steal it without asking for my permission
-vs dave dev T5mpler 
i have to put this here just in case you think of doing so
*/
class CreditsMenuState extends MusicBeatState
{
   var selectedFormat:FlxText;
   var defaultFormat:FlxText;
   var curNameSelected:Int = 0;
   var creditsTextGroup:Array<CreditsText> = new Array<CreditsText>();
   var menuItems:Array<CreditsText> = new Array<CreditsText>();
   var state:State;
   var selectedPersonGroup:FlxSpriteGroup = new FlxSpriteGroup();
   var selectPersonCam:FlxCamera = new FlxCamera();
   var mainCam:FlxCamera = new FlxCamera();
   var transitioning:Bool = false;

   var curSocialMediaSelected:Int = 0;
   var socialButtons:Array<SocialButton> = new Array<SocialButton>();
   var hasSocialMedia:Bool = true;
   var peopleInCredits:Array<Person> = 
   [
      //devs
      new Person("Sebastian Elijah", CreditsType.Director, "Director, Composer, Charter",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCi0rh4K458MFFpWApe5ILxQ'),
            new Social('roblox', 'https://www.roblox.com/users/2417667669/profile'),
            new Social('discord', 'Sebastian Elijah#4898'),
            new Social('gamebanana', 'https://gamebanana.com/members/2052778')
         ]
      ),
      new Person("Antarkh", CreditsType.Composer, "Composer",
         [
            new Social('youtube', 'https://www.youtube.com/c/AntarkhIsMe/featured'),
            new Social('twitter', 'https://twitter.com/itsAntarkh'),
            new Social('discord', 'Antarkh#3522'),
            new Social('roblox', 'https://www.roblox.com/users/3349680633/profile')
         ]
      ),
      new Person("ScratchZRL", CreditsType.Composer, "Artist, Composer, Animator,",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCcr8KTWt83WRdKWsG2vxg_w'),
            new Social('discord', 'ScratchRZL#1679')
         ]
      ),
      new Person("viniciusvmor", CreditsType.Composer, "Composer",
         [
            new Social('youtube', 'https://www.youtube.com/c/viniciusvmor/featured'),
            new Social('discord', 'vin eats noodles#3656')

         ]
      ),
      new Person("gecko", CreditsType.Composer, "Composer",
         [
            new Social('gamebanana', 'https://gamebanana.com/members/2119328'),
            new Social('discord', 'gecko#7470')
         ]
      ),
      new Person("NobodyKnows", CreditsType.Composer, "Composer",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCvtRmp2KyU_9TeKFsiZbo3w/featured'),
            new Social('discord', 'NobodyKnows#0172')
         ]
      ),
      new Person("AngryRacc", CreditsType.Composer, "Composer",
      [
         new Social('youtube', 'https://www.youtube.com/channel/UCE4zmeWtq9riXTt0H8KCIEA'),
         new Social('discord', 'Racc From Fed-Ex#4978'),
         new Social('twitch', 'https://www.twitch.tv/rambunctiousracc6')
      ]
   ),
   new Person("Blueberry76", CreditsType.Composer, "Composer",
      [
         new Social('discord', 'BlueBerry76#4729')
      ]
   ),
   new Person("Melad1590", CreditsType.Composer, "Composer",
      [
         new Social('discord', 'Meladenshin#9068'),
         new Social('youtube', 'https://www.youtube.com/channel/UCUWYJDdrybOCFVJmiaGx4qA')
      ]
   ),
   new Person("PixelCode", CreditsType.Composer, "Composer",
      [
         new Social('discord', 'PixelCode#8640'),
         new Social('youtube', 'https://www.youtube.com/channel/UCzSBhBcblU8az2A2Ypjts3g')
      ]
   ),
   new Person("Jake [Juwann] Studios", CreditsType.Composer, "Composer",
   [
      new Social('discord', 'Jake [Juwann] Studios#8253')   
   ]
   ),
   new Person("Toxsiu", CreditsType.Composer, "Composer",
   [
      new Social('discord', 'Toxsiu#0001'),
      new Social('youtube', 'https://www.youtube.com/channel/UCS1WRz2qiSve5sPsqeAyCuw')
   ]
   ),
   new Person("xJonny", CreditsType.Composer, "Composer",
   [
      new Social('discord', 'xJonny#6806'),
      new Social('youtube', 'https://www.youtube.com/channel/UC2lyB9i1obW2vB6TS16njfg'),
      new Social('twitter', 'https://twitter.com/OofGaming7?s=09')
   ]
   ),
   new Person("srPerez", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/c/sebaelperezoso'),
      new Social('twitter', 'https://twitter.com/NewSrPerez')
   ]
   ),
   new Person("Saruky", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/c/Saruky'),
      new Social('twitter', 'https://twitter.com/Saruky__z'),
      new Social('soundcloud', 'https://soundcloud.com/saruky')
   ]
   ),
   new Person("Joan Atlas", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/c/JoanAtlas'),
      new Social('twitter', 'https://twitter.com/joan_atlas'),
      new Social('soundcloud', 'https://soundcloud.com/joanatlas')
   ]
   ),
   new Person("Treency", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/channel/UCuhlP9XAqB7AGJOaQ7GomZg')
   ]
   ),
   new Person("Jasyak", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/c/Jasyak'),
      new Social('twitch', 'https://www.twitch.tv/Jasyak')
   ]
   ),
   new Person("Tomz_", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/channel/UCzjVIEZwtGqMurIfrwytMqQ'),
      new Social('roblox', 'https://www.roblox.com/users/2908665448/profile')
   ]
   ),
   new Person("Magma Blood", CreditsType.Composer, "Composer",
   [
   ]
   ),
   new Person("ToN", CreditsType.Composer, "Composer",
   [
   ]
   ),
   new Person("•[Arty And Funky FL]•", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/channel/UC_KPm1DgNTJBZtksjr9bQ9w'),
      new Social('soundcloud', 'https://soundcloud.com/arty-fl-studio?ref=clipboard&p=a&c=1&si=b437d55d42c14fd1b831280e1947f525&utm_campaign=social_sharing&utm_medium=text&utm_source=clipboard')
   ]
   ),
   new Person("JJTheProducer", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/c/BaseAbsol')
   ]
   ),
   new Person("Corbin Combo", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/channel/UCpEj60uKOobWJ4rXPb7NJfw')
   ]
   ),
   new Person("PicoGaming", CreditsType.Composer, "Composer",
   [
   ]
   ),
   new Person("Hortas", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/c/hortasfnf')
   ]
   ),
   new Person("Corbin Combo", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/channel/UCJf5btKH-GYYATkvDgVdsCg')
   ]
   ),
   new Person("ronbrazy", CreditsType.Composer, "Composer",
   [
      new Social('youtube', 'https://www.youtube.com/c/ronbrazy')
   ]
   ),
   new Person("Vortex", CreditsType.Dev, "Developer",
   [
      new Social('discord', 'VortexDev#2258'),
      new Social('gamebanana', 'https://gamebanana.com/members/2031557'),
      new Social('roblox', 'https://www.roblox.com/users/343029521/profile')
   ]
   ),
   new Person("Magi", CreditsType.Charter, "4k Mania Charter",
   [
      new Social('discord', 'Magi Wagi#1738'),
      new Social('youtube', 'https://www.youtube.com/channel/UC4UFCIqjAZAY-1TpwXOlfrw'),
      new Social('twitter', 'https://twitter.com/MagiciansWRLD'),
      new Social('twitch', 'https://www.twitch.tv/magicianswrld')
   ]
   ),
   new Person("Saad", CreditsType.Charter, "4k Mania Charter",
   [
      new Social('discord', 'Saad#6393'),
      new Social('youtube', 'https://www.youtube.com/channel/UCBM--Lmf6TJWKq4s_XHyNEQ'),
      new Social('roblox', 'https://www.roblox.com/users/550809359/profile'),
      new Social('twitch', 'https://www.twitch.tv/saadbeof')
   ]
   ),
   new Person("Kirbo", CreditsType.Charter, "4k Mania Charter",
   [
      new Social('discord', 'LuigiKirbo902#6899'),
      new Social('youtube', 'https://www.youtube.com/channel/UCMTsN3JATu4PpIWNBZGRAQQ'),
      new Social('twitch', 'https://www.twitch.tv/luigikirbo')
   ]
   ),
   new Person("Stoney", CreditsType.Art, "Artist",
   [
      new Social('discord', 'stoney#9241'),
      new Social('twitch', 'https://www.twitch.tv/1kimmmm1'),
      new Social('twitter', 'https://twitter.com/YTOG_90s'),
      new Social('youtube', 'https://www.youtube.com/channel/UCMf0i-AQYOUDtEXnrGEH-Xw')
   ]
   ),
   new Person("Bloopers", CreditsType.Art, "Artist",
   [
      new Social('discord', 'stoney#Krimdon#9999')
   ]
   ),
   new Person("danielgamer2467", CreditsType.Art, "Artist",
   [
      new Social('youtube', 'https://www.youtube.com/c/DanielGamer2467')
   ]
   ),
   new Person("Modeus", CreditsType.Art, "Artist",
   [
      new Social('discord', 'modeusUTMV#1173')
   ]
   ),
   new Person("TheMineFormer", CreditsType.Art, "Artist",
   [
      new Social('discord', 'TheMineFormer#0797'),
      new Social('youtube', 'https://www.youtube.com/channel/UCigyKOgADtugeLiIwMzYPHQ'),
      new Social('twitter', 'https://twitter.com/TheMineFormer')
   ]
   ),
   new Person("Ronezkj15", CreditsType.SpecialThanks, "New Godmode Red Shaggy Sprites / flas",
   [
      new Social('youtube', 'https://www.youtube.com/c/Ronezkj15'),
      new Social('roblox', 'https://www.roblox.com/users/68713400/profile'),
      new Social('twitter', 'https://twitter.com/Ronezkj15'),
      new Social('discord', 'Ronezkj15#8071')
   ]
   ),
   new Person("Golden Apple Team", CreditsType.SpecialThanks, "Credits Menu Code and Character Select Code",
   [
   ]
   ),
   new Person("Hd Team", CreditsType.SpecialThanks, "New Menu Code",
   [
   ]
   ),
   new Person("Demigod Duel Team", CreditsType.SpecialThanks, "Composed By Code",
   [
   ]
   ),
   ];

	override function create()
	{
      FlxG.sound.playMusic(Paths.music("optionsMenu"),1,true);
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
      var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('images/menuBG'));
      #if desktop
      DiscordClient.changePresence("In the Credits Menu", null);
      #end

      mainCam.bgColor.alpha = 0;
      selectPersonCam.bgColor.alpha = 0;
      FlxG.cameras.reset(mainCam);
      FlxG.cameras.add(selectPersonCam);

      FlxCamera.defaultCameras = [mainCam];
      selectedPersonGroup.cameras = [selectPersonCam];

      state = State.SelectingName;
      defaultFormat = new FlxText().setFormat("Comic Sans MS Bold", 32, FlxColor.WHITE, CENTER);
      selectedFormat = new FlxText().setFormat("Comic Sans MS Bold", 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
      
		bg.color = 0xFFFF0000;
      bg.scrollFactor.set();
		add(bg);
      
      var developers:Array<Person> = new Array<Person>();
      var specialthanks:Array<Person> = new Array<Person>();
      var director:Array<Person> = new Array<Person>();
      var composers:Array<Person> = new Array<Person>();
      var betaTesters:Array<Person> = new Array<Person>();
      var contributors:Array<Person> = new Array<Person>();
      var charter:Array<Person> = new Array<Person>();
      var art:Array<Person> = new Array<Person>();


      for (person in peopleInCredits) 
      {
         switch (person.creditsType)
         {
            case Dev: developers.push(person);
            case SpecialThanks: specialthanks.push(person);
            case Director: director.push(person);
            case Composer: composers.push(person);
            case BetaTester: betaTesters.push(person);
            case Contributor: contributors.push(person);
            case Charter: charter.push(person);
            case Art: art.push(person);

         }
      }

      for (i in 0...peopleInCredits.length)
      {
         var currentPerson = peopleInCredits[i];
         if (currentPerson == developers[0] || currentPerson == director[0] || currentPerson == composers[0] || currentPerson == contributors[0] || currentPerson == betaTesters[0] || currentPerson == charter[0] || currentPerson == specialthanks[0] || currentPerson == art[0])
         {
            var textString:String = '';
            switch (currentPerson.creditsType)
            {
               case Dev:
                  textString = 'Developers';
               case Director:
                  textString = 'Director';
               case SpecialThanks:
                  textString = 'Special Thanks';
               case Composer:
                  textString = 'Composers';
               case Contributor:
                  textString = 'Contributors';
               case BetaTester:
                  textString = 'Beta Testers';
               case Charter:
                  textString = 'Charter';
               case Art:
                  textString = 'Art';
            }
            var titleText:FlxText = new FlxText(0, 0, 0, textString);
            titleText.setFormat("Comic Sans MS Bold", 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            titleText.borderSize = 3;
            titleText.borderQuality = 3;
            titleText.screenCenter(X);
            titleText.scrollFactor.set(0, 1);

            var creditsTextTitleText = new CreditsText(titleText, false);
            creditsTextGroup.push(creditsTextTitleText);
            add(titleText);
         }

         var textItem:FlxText = new FlxText(0, i * 50, 0, currentPerson.name, 32);
         textItem.setFormat(defaultFormat.font, defaultFormat.size, defaultFormat.color, defaultFormat.alignment, defaultFormat.borderStyle, defaultFormat.borderColor);
         textItem.borderSize = 3;
         textItem.borderQuality = 3;
         textItem.screenCenter(X);
         textItem.scrollFactor.set(0, 1);
         
         var creditsTextItem:CreditsText = new CreditsText(textItem, true);

         add(textItem);
         creditsTextGroup.push(creditsTextItem);
         menuItems.push(creditsTextItem);
      }
      var selection = 0;
      changeSelection();
      for (creditsText in creditsTextGroup)
      {
         creditsText.selectionId = selection - curNameSelected;
         selection++;  
      }
      for (creditsText in creditsTextGroup)
      {
         var scaledY = FlxMath.remapToRange(creditsText.selectionId, 0, 1, 0, 1.3);
         creditsText.text.y = scaledY * 75 + (FlxG.height * 0.5);
      }

		super.create();
	}
   
	override function update(elapsed:Float)
   {
      var fadeTimer:Float = 0.08;
      var upPressed = controls.UP_P;
		var downPressed = controls.DOWN_P;
		var back = controls.BACK;
		var accept = controls.ACCEPT;
      switch (state)
      {
         case State.SelectingName:
				if (upPressed)
				{
               changeSelection(-1);
				}
				if (downPressed)
				{
               changeSelection(1);
            }
				if (back)
				{
					FlxG.switchState(new MainMenuState());
				}
				if (accept && !transitioning)
				{
               transitioning = true;
               for (creditsText in creditsTextGroup)
               {
                  FlxTween.tween(creditsText.text, {alpha: 0}, fadeTimer);
                  if (creditsText == creditsTextGroup[creditsTextGroup.length - 1])
                  {
                     FlxTween.tween(creditsText.text, {alpha: 0}, fadeTimer, 
                     {
                        onComplete: function(tween:FlxTween)
                        {
                           FlxCamera.defaultCameras = [selectPersonCam];
                           selectPerson(peopleInCredits[curNameSelected]);
                        }
                     });
                  }
               }
				}
         case State.OnName:
            if (back && !transitioning)
            {
               transitioning = true; 
               for (item in selectedPersonGroup)
               {
                  FlxTween.tween(item, {alpha: 0}, fadeTimer);
                  if (item == selectedPersonGroup.members[selectedPersonGroup.members.length - 1])
                  {
                     FlxTween.tween(item, {alpha: 0}, fadeTimer,
                     { 
                        onComplete: function (tween:FlxTween) 
                        {
                           selectedPersonGroup.forEach(function(spr:FlxSprite)
                           {
                              remove(selectedPersonGroup.remove(spr, true));
                           });
                           for (i in 0...socialButtons.length) 
                           {
                              socialButtons.remove(socialButtons[i]);
                           }
                           FlxCamera.defaultCameras = [mainCam];
                           for (creditsText in creditsTextGroup)
                           {
                              FlxTween.tween(creditsText.text, {alpha: 1}, fadeTimer);
                              if (creditsText == creditsTextGroup[creditsTextGroup.length - 1])
                              {
                                 FlxTween.tween(creditsText.text, {alpha: 1}, fadeTimer, 
                                 {
                                    onComplete: function(tween:FlxTween)
                                    {
                                       selectedPersonGroup = new FlxSpriteGroup();
                                       socialButtons = new Array<SocialButton>();
                                       FlxG.mouse.visible = false;
                                       transitioning = false;
                                       state = State.SelectingName;
                                    }
                                 });
                              }
                           }
                        }
                     });
                  }
               }
            }
            if (hasSocialMedia)
            {
               if (upPressed)
               {
                    changeSocialMediaSelection(-1);
               }
               if (downPressed)
               {
                  changeSocialMediaSelection(1);
               }
               if (accept)
               {
                  var socialButton = socialButtons[curSocialMediaSelected];
                  if (socialButton != null && socialButton.socialMedia.socialMediaName != 'discord')
                  {
                     FlxG.openURL(socialButton.socialMedia.socialLink);
                  }
               }
            }
      }
      
      super.update(elapsed);
   }

   function changeSelection(amount:Int = 0)
   {
      if (amount != 0)
      {
         FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
         curNameSelected += amount;
      }
      if (curNameSelected > peopleInCredits.length - 1)
      {
         curNameSelected = 0;
      }
      if (curNameSelected < 0)
      {
         curNameSelected = peopleInCredits.length - 1;
      }
      FlxG.camera.follow(menuItems[curNameSelected].text, 0.1);
      updateText(curNameSelected);
   }
   function changeSocialMediaSelection(amount:Int = 0)
   {
      if (amount != 0)
      {
         FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
         curSocialMediaSelected += amount;
      }
      if (curSocialMediaSelected > socialButtons.length - 1)
      {
         curSocialMediaSelected = 0;
      }
      if (curSocialMediaSelected < 0)
      {
         curSocialMediaSelected = socialButtons.length - 1;
      }
      updateSocialMediaUI();
   }

   function updateText(index:Int)
   {
      var currentText:FlxText = menuItems[index].text;
      if (menuItems[index].menuItem)
      {
		   currentText.setFormat(selectedFormat.font, selectedFormat.size, selectedFormat.color, selectedFormat.alignment, selectedFormat.borderStyle, 
            selectedFormat.borderColor);
      }
		for (i in 0...menuItems.length)
		{
         if (menuItems[i] == menuItems[curNameSelected])
         {
            continue;
         }
			var currentText:FlxText = menuItems[i].text;
			currentText.setFormat(defaultFormat.font, defaultFormat.size, defaultFormat.color, defaultFormat.alignment, defaultFormat.borderStyle,
				defaultFormat.borderColor);
			currentText.screenCenter(X);
		}
   }
   function updateSocialMediaUI()
   {
      if (hasSocialMedia)
      {
         for (socialButton in socialButtons)
         {
            var isCurrentSelected = socialButton == socialButtons[curSocialMediaSelected];
            if (isCurrentSelected)
            {
               fadeSocialMedia(socialButton, 1);
            }
            else
            {
               fadeSocialMedia(socialButton, 0.3);
            }
         }
      }
   }
   function fadeSocialMedia(socialButton:SocialButton, amount:Float)
   {
      for (i in 0...socialButton.graphics.length) 
      {
         var graphic:FlxSprite = socialButton.graphics[i];
         graphic.alpha = amount;
      }
   }

   function selectPerson(selectedPerson:Person)
   {
      curSocialMediaSelected = 0;
      var fadeTime:Float = 0.4;
      var blackBg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
      blackBg.screenCenter(X);
      blackBg.updateHitbox();
      blackBg.scrollFactor.set();
      blackBg.active = false;

      var personName:FlxText = new FlxText(0, 100, 0, selectedPerson.name, 50);
      personName.setFormat(selectedFormat.font, selectedFormat.size, selectedFormat.color, selectedFormat.alignment, selectedFormat.borderStyle, selectedFormat.borderColor);
      personName.screenCenter(X);
      personName.updateHitbox();
      personName.scrollFactor.set();
      personName.active = false;
      
      var credits:FlxText = new FlxText(0, personName.y + 50, FlxG.width / 1.25, selectedPerson.credits, 25);
      credits.setFormat(selectedFormat.font, selectedFormat.size, selectedFormat.color, selectedFormat.alignment, selectedFormat.borderStyle, selectedFormat.borderColor);
      credits.screenCenter(X);
      credits.updateHitbox();
      credits.scrollFactor.set();
      credits.active = false;

      blackBg.alpha = 0;
      personName.alpha = 0;
      credits.alpha = 0;
      
      selectedPersonGroup.add(blackBg);
      selectedPersonGroup.add(personName);
      selectedPersonGroup.add(credits);

      add(blackBg);
      add(personName);
      add(credits);

      FlxTween.tween(blackBg, { alpha: 0.7 }, fadeTime);
      FlxTween.tween(personName, { alpha: 1 }, fadeTime);
      FlxTween.tween(credits, { alpha: 1 }, fadeTime, { onComplete: function(tween:FlxTween)
      {
         if (selectedPerson.socialMedia.length == 0)
         {
            transitioning = false;
            state = State.OnName;
         }
      }});
      
      for (i in 0...selectedPerson.socialMedia.length)
      {
         var social:Social = selectedPerson.socialMedia[i];
         var socialGraphic:FlxSprite = new FlxSprite(0, credits.y + 100 + (i * 100)).loadGraphic(Paths.image('credits/' + social.socialMediaName));
         var discordText:FlxText = null;
         socialGraphic.updateHitbox();
         socialGraphic.screenCenter(X);
         socialGraphic.scrollFactor.set();
         socialGraphic.active = false;
         socialGraphic.alpha = 0;
         add(socialGraphic);

         if (social.socialMediaName == 'discord')
         {
            var offsetY:Float = 20;
            discordText = new FlxText(socialGraphic.x + 100, socialGraphic.y + (i * 100) + offsetY, 0, social.socialLink, 40);
            discordText.setFormat(defaultFormat.font, defaultFormat.size, defaultFormat.color, defaultFormat.alignment, defaultFormat.borderStyle,
               defaultFormat.borderColor);
            discordText.alpha = 0;
            discordText.updateHitbox();
            discordText.scrollFactor.set();
            discordText.active = false;
            add(discordText);
            FlxTween.tween(discordText, { alpha: 1 }, fadeTime);
            selectedPersonGroup.add(discordText);
         }

         var socialButton:SocialButton;
         
         if (discordText != null)
         {
            socialButton = new SocialButton([socialGraphic, discordText], social);
         }
         else
         {
            socialButton = new SocialButton([socialGraphic], social);
         }
         socialButtons.push(socialButton);
         selectedPersonGroup.add(socialGraphic);
         
         var isCurrentSelectedButton = socialButton == socialButtons[curSocialMediaSelected];
         var targetAlpha = isCurrentSelectedButton ? 1 : 0.3;

         if (i == selectedPerson.socialMedia.length - 1)
         {
            FlxTween.tween(socialGraphic, { alpha: targetAlpha }, fadeTime, { onComplete: function(tween:FlxTween)
            {
               transitioning = false;
               state = State.OnName;
            }});
         }
         else
         {
            FlxTween.tween(socialGraphic, { alpha: targetAlpha }, fadeTime);
         }
      }
      hasSocialMedia = socialButtons.length != 0;

   }
}

class Person
{
   public var name:String;
   public var creditsType:CreditsType;
   public var credits:String;
	public var socialMedia:Array<Social>;

	public function new(name:String, creditsType:CreditsType, credits:String, socialMedia:Array<Social>)
	{
      this.name = name;
      this.creditsType = creditsType;
		this.credits = credits;
      this.socialMedia = socialMedia;
	}
}
class Social
{
   public var socialMediaName:String;
   public var socialLink:String;

   public function new(socialMedia:String, socialLink:String)
   {
      this.socialMediaName = socialMedia;
      this.socialLink = socialLink;
   }
}
class CreditsText
{
   public var text:FlxText;
   public var menuItem:Bool;
   public var selectionId:Int;

   public function new(text:FlxText, menuItem:Bool)
   {
      this.text = text;
      this.menuItem = menuItem;
   }
}
class SocialButton
{
   public var graphics:Array<FlxSprite>;
   public var socialMedia:Social;

   public function new(graphics:Array<FlxSprite>, socialMedia:Social)
   {
      this.graphics = graphics;
      this.socialMedia = socialMedia;
   }
}
enum CreditsType
{
   Dev; Director; Composer; BetaTester; Contributor; Charter; SpecialThanks; Art;
}
enum State
{
   SelectingName; OnName;
}
