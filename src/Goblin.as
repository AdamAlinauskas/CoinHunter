package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Goblin extends Enemy
	{
		[Embed(source = '../assets/Goblin.png')]
		public static var goblinImage:Class;
		
		public function Goblin() 
		{
			super(0xff003366);
			loadGraphic(goblinImage, false,false);
		}
	}
}