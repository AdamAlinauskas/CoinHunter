package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class Arrow extends FlxSprite
	{
		[Embed(source = '../assets/arrow.png')]
		public static var image:Class;
		public function Arrow() 
		{
			acceleration.x = 300;
			maxVelocity.x = 300;
			acceleration.y = 0;
			//makeGraphic(7, 3, 0xff472400);
			loadGraphic(image);
			mass = 200;
			kill();
		}
		
	}

}