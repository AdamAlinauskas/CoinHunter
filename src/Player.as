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
		
		public var facingLeft:Boolean;
		
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
				
			if (facingLeft)
				play("left");
			else
				play("right");
			//if (super.acceleration.x == 0)
				//return;
			//
			//if (super.acceleration.x > 0){
				//super.play("right");
				//facing = FlxObject.RIGHT;
				//facingLeft = false;
			//}
			//
			//if (super.acceleration.x < 0){
				//super.play("left");
				//facing = FlxObject.LEFT;
			//	facingLeft = true;
			//}
			
		}
		
		private function ArrowAccelerationDirection():int {
			
			return facingLeft ? -1 : 1;
		}
		
		public function ShootArrow(arrow:FlxSprite):void {
			arrow.x = super.x +20;
			arrow.y = super.y + 5;
			arrow.acceleration.x = arrow.maxVelocity.x * ArrowAccelerationDirection();
			arrow.revive();	
		}
	}
}