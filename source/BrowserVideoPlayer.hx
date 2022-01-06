#if android
package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxBasic;

import extension.webview.WebView;

using StringTools;

class BrowserVideoPlayer extends FlxBasic
{
	public static var androidPath:String = 'file:///android_asset/';

        public var finishCallback:Void->Void = null;

        public var stateCallback:FlxState;

	public function new()
	{
		super();
	}

        public function playVideo(source:String)
	{
		super();

		WebView.onClose = onClose;
		WebView.onURLChanging= onURLChanging;

		WebView.open(androidPath + source + '.html', false, null, ['http://exitme(.*)'], true, false);
	}

	function onClose()
	{
                if (finishCallback != null)
                {
			finishCallback();
		}
		else if (stateCallback != null)
		{
			LoadingState.loadAndSwitchState(stateCallback);
		}
	}

	function onURLChanging(url:String) 
	{
		if (url == 'http://exitme/') 
                         onClose(); // drity hack lol
	}
}
#end//only for android
