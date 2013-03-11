package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class Arrow extends FlxSprite
	{
		[Embed(source = '../assets/arrowSpriteSheet.png')]
		public static var image:Class;
		public function Arrow() 
		{
			acceleration.x = 0;
			maxVelocity.x = 2000;
			acceleration.y = 0;
			//makeGraphic(7, 3, 0xff472400);
			loadGraphic(image,true,false,20,8);
			mass = 100;
			kill();
			super.addAnimation("right", [0], 0, false);
			super.addAnimation("left", [1], 0, false);
		}
		
		public function UpdateDirection():void {
			if (super.acceleration.x == 0)
				return;
			
			if (super.acceleration.x > 0)
				super.play("right");
			
			if (super.acceleration.x < 0)
				super.play("left");	
		}
		
		override public function kill():void 
		{
			super.acceleration.x = 0;
			super.velocity.x = 0; 
			super.kill();
		}
		
	}

}