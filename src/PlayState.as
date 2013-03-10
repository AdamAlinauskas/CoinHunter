package  
{
	import flash.text.engine.BreakOpportunity;
	import flash.utils.Dictionary;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		var player:FlxSprite;
		public var level:FlxTilemap;
		var healthText:FlxText;
		var playerScoreText:FlxText;
		var enemyScoreText:FlxText;
		var coins:FlxGroup;
		var enemies:FlxGroup;
		var scores:Dictionary;
		var arrow:FlxSprite;
		
		[Embed(source="../assets/coin.mp3")] private var SoundEffectCoin:Class;
		[Embed(source="../assets/cautiouspath.mp3")] private var backgroundMusic:Class;
		[Embed(source="../assets/hit.mp3")] private var hitByArrowMusic:Class;
		override public function create():void 
		{
			super.create();
			arrow = new FlxSprite(0, 0);
			arrow.kill();
			FlxG.playMusic(backgroundMusic, 1.0);
			
			level = new Level();
			add(level);
			
			scores = new Dictionary();

			coins = createCoinGroup(0xffffff00, 20);
			enemies = createGoblinsFor(0xff003366,4);
			add(coins);
			add(enemies);
						
			player = new Player();
			
			healthText = new FlxText(FlxG.width-65, 10, 65);
			add(healthText);
			
			playerScoreText = new FlxText(8, 10, 100);
			playerScoreText.color = 0xff0000B8;
			add(playerScoreText);
			
			enemyScoreText = new FlxText(playerScoreText.width, 10, 100);
			enemyScoreText.color = 0xff990033;
			add(enemyScoreText);
			
			scores[player] = 0;
			scores[enemies] = 0;
			
			updateScore();
			updateHealth();

			add(player);
		}
						
		override public function update():void 
		{
			super.update();
			
			player.acceleration.x = 0;
			player.acceleration.y = 0;
			arrow.acceleration.y = 0;
			arrow.maxVelocity.y = 0;
			arrow.angularVelocity = 0;
			
			MovePlayer();
			
			FlxG.collide(player, level);
			FlxG.collide(coins, level,enemyCollideWithLevel);
			FlxG.collide(enemies, level, enemyCollideWithLevel);
			FlxG.collide(enemies, player,die);
			FlxG.collide(coins, player, collectCoin);
			FlxG.collide(coins, enemies, collectCoinForEnemyGroup);
			FlxG.collide(enemies, arrow, enemyCollideWithArrow);
			FlxG.collide(arrow, level, function (arrow:FlxSprite, level:FlxTilemap) { arrow.kill(); } );
			
			if (FlxG.keys.SPACE) {
				if(arrow.alive == false){
					arrow.x = player.x +5;
					arrow.y = player.y;
					arrow.acceleration.x = 200;
					arrow.maxVelocity.x = 200;
					arrow.acceleration.y = 0;
					arrow.makeGraphic(2, 2, 0xff472400);
					arrow.revive();
					arrow.mass = 200;
					add(arrow);
				}
			}
			
			YouWin();
		}
		
		private function YouWin():void {
			if(coins.countDead() == coins.length && enemies.countDead() == enemies.length){
				enemies.kill();
				var text:String = scores[player] > scores[enemies] ? "You Win :)" : "Loser :(";				
				add(new FlxText(FlxG.width / 2, FlxG.height / 3,100, text));
			}
		}
		
		private function createGoblinsFor(color:uint,count:uint) {
			var group:FlxGroup = new FlxGroup();
			while(count != 0){
				group.add(new Goblin());
				count--;
			}
			return group;
		}
		
		private function createCoinGroup(color:uint,count:uint) {
			var group:FlxGroup = new FlxGroup();
			while(count != 0){
				group.add(new Coin());
				count--;
			}
			return group;
		}
		
		private function updateHealth():void {
				healthText.text = "Health: "+ player.health;
		}
		
		private function updateScore():void {
			playerScoreText.text = "Player: " + scores[player];
			enemyScoreText.text = "Enemy: " + scores[enemies];
		}
		
		private function enemyCollideWithLevel(enemy:FlxSprite, level:FlxTilemap):void {
			if (enemy.isTouching(FlxObject.CEILING))
					enemy.acceleration.y = enemy.maxVelocity.y * 4;
					
			if (enemy.isTouching(FlxObject.FLOOR))
					enemy.acceleration.y = -enemy.maxVelocity.y * 4;
			
			if (enemy.isTouching(FlxObject.LEFT)) 
					enemy.acceleration.x = enemy.maxVelocity.x * 4;
			
			if (enemy.isTouching(FlxObject.RIGHT))
					enemy.acceleration.x = -enemy.maxVelocity.x * 4;
					
		}
		
		private function enemyCollideWithArrow(enemy:FlxSprite, arrow:FlxSprite) {
				enemy.health -= 25;
				
				if (enemy.health == 0) {
						enemy.kill();
				}
				
				FlxG.play(hitByArrowMusic, 0.3);
				
				arrow.kill();
		}
		
		private function collectCoinForEnemyGroup(coin:FlxSprite, sprite:FlxSprite):void {
			scores[enemies] += 1;
			updateScore();
			collectCoin(coin, null);
		}
		
		private function collectCoin(coin:FlxSprite, sprite:FlxSprite):void {
			coin.kill();
			if(sprite != null){
				scores[sprite] += 1;
				updateScore();
			}
				FlxG.play(SoundEffectCoin,0.1);
		}
		
		private function die(enemy:FlxSprite, player:FlxSprite):void {
			player.health -= 1;
			updateHealth();
			
			if(player.health == 0){
				player.kill();
			}
		}
		
		private function MovePlayer():void 
		{
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
		}
		
		public function randomNumberBetween(from:int, to:int):int {
			return Math.floor(Math.random()*(to-from+1)+from);
		}
	}
}