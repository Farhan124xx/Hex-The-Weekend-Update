import flixel.FlxG;
import flixel.FlxSprite;

class StoryScene extends MusicBeatState
{
	public var handler:BrowserVideoPlayer;

	public var path:String = "";

	public function new(bruh)
	{
		path = bruh;
		super();
	}

	public override function load()
	{
		handler = new BrowserVideoPlayer();
	}

	public override function update(elapsed)
	{
		if (FlxG.keys.justPressed.ESCAPE)
		{
			handler.kill();
			switchState(new BruhADiagWindow(PlayState.SONG.songId));
		}
		super.update(elapsed);
	}

	public override function create()
	{
		handler.playVideo(path);
		handler.finishCallback = function()
		{
			switchState(new BruhADiagWindow(PlayState.SONG.songId));
		};
		super.create();
	}
}
