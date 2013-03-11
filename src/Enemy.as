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
			
			super(randomNumberBetween(10,FlxG.width-40), randomNumberBetween(10,FlxG.height-40));
			makeGraphic(10, 12, color);
			acceleration.y = randomNumberBetween(20,maxSpeed) * direction();
			maxVelocity.y = randomNumberBetween(10,maxSpeed);
			acceleration.x = randomNumberBetween(20,maxSpeed) * direction();
			maxVelocity.x = randomNumberBetween(10,maxSpeed);;
		}
		
		public function randomNumberBetween(from:int, to:int):int {
			return Math.floor(Math.random()*(to-from+1)+from);
		}
		
		public function direction():int {
			if (randomNumberBetween(0, 100) % 2)
				return 1;
			else
				return -1;
		}
		
	}

}