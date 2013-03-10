package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/archer.png')]
		public static var image:Class;
		
		public function Player() 
		{
			super(FlxG.width/2, 30);
			loadGraphic(image, false, false);
			//player = new FlxSprite(FlxG.width/2, 30);
			//makeGraphic(10, 12, 0xffaa1111);
			acceleration.x = 10;
			maxVelocity.x = 140;
			drag.x = maxVelocity.x * 4;
			health = 100;
			
			acceleration.y = 10;
			maxVelocity.y = 140;
			drag.y = maxVelocity.y * 4;
		}
		
	}

}