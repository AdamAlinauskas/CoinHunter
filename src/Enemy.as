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
			super(randomNumberBetween(10,100), randomNumberBetween(10,100));
			makeGraphic(10, 12, color);
			acceleration.y = randomNumberBetween(20,90) * direction();
			maxVelocity.y = randomNumberBetween(10,90);
			acceleration.x = randomNumberBetween(20,90) * direction();
			maxVelocity.x = randomNumberBetween(10,90);;
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