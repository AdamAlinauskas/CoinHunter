package  
{
	import org.flixel.FlxGame;
	import org.flixel.*;
	
	[SWF(Width="800", height="600",backgroundColor="#ff00aa")]
	public class CoinHunter extends FlxGame
	{
		public function CoinHunter() 
		{
			super(400, 300, MenuState,2);
		}	
	}

}