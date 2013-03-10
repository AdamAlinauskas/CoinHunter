package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class Arrow extends FlxSprite
	{
		
		public function Arrow() 
		{
			acceleration.x = 200;
			maxVelocity.x = 200;
			acceleration.y = 0;
			makeGraphic(2, 2, 0xff472400);
			mass = 200;
			kill();
		}
		
	}

}