package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Goblin extends Enemy
	{
		[Embed(source = '../assets/GoblinSpriteSheet.png')]
		public static var goblinImage:Class;
		
		public function Goblin() 
		{
			super(0xff003366);
			loadGraphic(goblinImage, false, false,36,42);
			health = 100;
			super.addAnimation("right", [0], 0, false);
			super.addAnimation("left", [1], 0, false);
		}
		
		public function UpdateDirection():void {
				
			if (super.velocity.x == 0)
				return;
			
			if (super.velocity.x > 0)
				super.play("right");
			
			if (super.velocity.x < 0)
				super.play("left");
			
		}
	}
}