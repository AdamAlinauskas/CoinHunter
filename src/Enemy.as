package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class Enemy extends FlxSprite
	{
		public function Enemy(color:uint)
		{
			var maxSpeed:uint = 60;
			
			super(Utility.RandomNumberBetween(10,FlxG.width-40), Utility.RandomNumberBetween(10,FlxG.height-40));
			makeGraphic(10, 12, color);
			acceleration.y = Utility.RandomNumberBetween(20,maxSpeed) * direction();
			maxVelocity.y = Utility.RandomNumberBetween(10,maxSpeed);
			acceleration.x = Utility.RandomNumberBetween(20,maxSpeed) * direction();
			maxVelocity.x = Utility.RandomNumberBetween(10,maxSpeed);;
		}
		
		public function direction():int {
			if (Utility.RandomNumberBetween(0, 100) % 2)
				return 1;
			else
				return -1;
		}
	}
}