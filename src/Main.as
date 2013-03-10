package  
{
	import org.flixel.FlxGame;
	import org.flixel.*;
	
	[SWF(Width="800", height="600",backgroundColor="#ff00aa")]
	public class Main extends FlxGame
	{
		public function Main() 
		{
			super(400, 300, MenuState,2);
		}	
	}

}