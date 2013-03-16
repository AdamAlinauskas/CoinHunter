package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class BloodManager extends FlxGroup
	{
		public function BloodManager() 
		{
			for (var i:int = 0; i < 20; i++)
			{
				add(new BloodEmitter);
			}
		}
		
		public function explodeBlock(ax:int, ay:int):void
		{	
			var blood:FlxEmitter = FlxEmitter(getFirstAvailable());
			
			if(blood){				
				blood.x = ax;
				blood.y = ay;
				blood.start(true, 1, 1);
			}
		}
		
	}

}