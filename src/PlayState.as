package  
{
	import flash.utils.Dictionary;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		var player:FlxSprite;
		public var level:FlxTilemap;
		var text:FlxText;
		var health:FlxText;
		var coins:FlxGroup;
		var enemyGroup2:FlxGroup;
		var scores:Dictionary;
		
		override public function create():void 
		{
			super.create();
			
			scores = new Dictionary();
			
			
			
			
			
			
			coins = createEnemyGroupFor(0xffffff00, 12);
			enemyGroup2 = createEnemyGroupFor(0xff003366,3);
			
			add(coins);
			add(enemyGroup2);
						
			player = new FlxSprite(FlxG.width/2, 30);
			player.makeGraphic(10, 12, 0xffaa1111);
			player.acceleration.x = 10;
			player.maxVelocity.x = 140;
			player.drag.x = player.maxVelocity.x * 4;
			player.health = 100;
			
			player.acceleration.y = 10;
			player.maxVelocity.y = 80;
			player.drag.y = player.maxVelocity.y * 4;
			
			text = new FlxText(10, 10, 50, "Debug");
			add(text);
			
			health = new FlxText(10, 30, 50);
			add(health);
			updateHealth();

			
			scores[player] = 0;


			var data:Array = new Array(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
FlxG.bgColor = 0xffaaaaaa;
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.arrayToCSV(data, 40), FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
			add(level);
			

			add(player);
		}
		
				
		override public function update():void 
		{
			super.update();
			
			player.acceleration.x = 0;
			player.acceleration.y = 0;
			
			
			if (FlxG.keys.RIGHT) {
				player.acceleration.x = player.maxVelocity.x * 4;
			}
			if (FlxG.keys.LEFT) {
				player.acceleration.x = -player.maxVelocity.x * 4;
			}
			if (FlxG.keys.UP) {
				player.acceleration.y = -player.maxVelocity.y * 4;
			}
			if (FlxG.keys.DOWN) {
				player.acceleration.y = player.maxVelocity.y * 4;
			}
			
			FlxG.collide(player, level);

			
			FlxG.collide(coins, level,enemyCollideWithLevel);
			FlxG.collide(enemyGroup2, level, enemyCollideWithLevel);
			FlxG.collide(enemyGroup2, player,die);
			FlxG.collide(coins, player, collectCoin);
			FlxG.collide(coins, enemyGroup2, collectCoin);
			
			//if (enemy.velocity.y  == 0) {
//text.text = "Velocity is 0";
				//enemy.acceleration.y = (enemy.acceleration.y * 4) * (-1);
			//}
			//else {
				//text.text = "moving";
				//}
			//text.text = "" + enemy.acceleration.y;
			
		
			
			
			
		}
		
		private function createEnemyGroupFor(color:uint,count:uint) {
			var group:FlxGroup = new FlxGroup();
			while(count != 0){
				group.add(new Enemy(color));
				count--;
			}
			return group;
		}
		
		private function updateHealth():void {
				health.text = "Health: "+ player.health;
		}
		
		private function updateScore():void {
			
		}
		
		private function enemyCollideWithLevel(enemy:FlxSprite, level:FlxTilemap):void {
			if (enemy.isTouching(FlxObject.CEILING)) {
					enemy.acceleration.y = enemy.maxVelocity.y * 4;
					
			}
			
			if (enemy.isTouching(FlxObject.FLOOR)) {
					enemy.acceleration.y = -enemy.maxVelocity.y * 4;
					
			}
			
			if (enemy.isTouching(FlxObject.LEFT)) {
					enemy.acceleration.x = enemy.maxVelocity.x * 4;
					
			}
			
			if (enemy.isTouching(FlxObject.RIGHT)) {
					enemy.acceleration.x = -enemy.maxVelocity.x * 4;
					
			}
		}
		
		private function collectCoin(coin:FlxSprite, player:FlxSprite):void {
			text.text = "KILL";	
			coin.kill();
			scores[player] += 1;
			
			updateScore();
			
			//	FlxG.play(SoundEffectCoin,0.3);
			//	score++;
			//	updateScore();
		}
		
		private function die(enemy:FlxSprite, player:FlxSprite):void {
			player.health -= 1;
			updateHealth();
			
			if(player.health == 0){
				player.kill();
				text.text = "YOU LOSE";
			}
			
			//	FlxG.play(SoundEffectCoin,0.3);
			//	score++;
			//	updateScore();
		}
		
		
		public function randomNumberBetween(from:int, to:int):int {
			return Math.floor(Math.random()*(to-from+1)+from);
		}
	}

}