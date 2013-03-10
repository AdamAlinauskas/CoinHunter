package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/archerSpriteSheet.png')]
		public static var image:Class;
		
		public function Player() 
		{
			super(FlxG.width/2, 30);
			loadGraphic(image, false, false,32,32);
			//player = new FlxSprite(FlxG.width/2, 30);
			//makeGraphic(10, 12, 0xffaa1111);
			acceleration.x = 10;
			maxVelocity.x = 140;
			drag.x = maxVelocity.x * 4;
			health = 100;
			
			acceleration.y = 10;
			maxVelocity.y = 140;
			drag.y = maxVelocity.y * 4;
			//super.loadRotatedGraphic(image);
			super.addAnimation("right", [0], 0, false);
			super.addAnimation("left", [1], 0, false);
		}
		
		public function UpdateDirection():void {
				
			if (super.velocity.x == 0)
				return;
			
			if (super.velocity.x > 0)
				super.play("right");
			
			if (super.velocity.x < 0)
				super.play("left");
			
		}
		
	}

}