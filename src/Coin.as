package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Coin extends Enemy
	{
		[Embed(source = '../assets/coin.png')]
		public static var image:Class;
		public function Coin() 
		{
			super(0xff003366);
			loadGraphic(image, false, false);
			
		}	
	}
}