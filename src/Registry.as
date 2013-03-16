package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Registry 
	{
		public static var blood:BloodManager;
		
		public function Registry() 
		{
		}
		
		public static function init():void {
			blood = new BloodManager;
		}
		
	}

}