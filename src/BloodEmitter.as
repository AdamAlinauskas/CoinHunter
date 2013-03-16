package  
{
	import org.flixel.FlxEmitter;
	/**
	 * ...
	 * @author Adam
	 */
	public class BloodEmitter extends FlxEmitter
	{
		
		public function BloodEmitter() 
		{
			setSize(8, 8);
			gravity = 200;
			setXSpeed(-50, 50);
			setYSpeed( -30, -60);
			setRotation(0, 0);
			makeParticles(BloodBitMap, 100, 0, true);
			kill();
		}
		
		
		override public function update():void 
		{
			super.update();
			if (super.countDead() == super.length) {
				kill();	
			}
		}
		
	}

}