package  
{
	public class Utility 
	{
		public function Utility() {	}
		
		public static function RandomNumberBetween(from:int, to:int):int {
			return Math.floor(Math.random()*(to-from+1)+from);
		}
	}
}