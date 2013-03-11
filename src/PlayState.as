package  
{
	import flash.text.engine.BreakOpportunity;
	import flash.utils.Dictionary;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var player:Player;
		public var level:FlxTilemap;
		private var healthText:FlxText;
		private var playerScoreText:FlxText;
		private var enemyScoreText:FlxText;
		private var coins:FlxGroup;
		private var enemies:FlxGroup;
		private var scores:Dictionary;
		private var arrow:Arrow;
		private var isGameOver:Boolean;
		private var backGroundMusicPlaying:FlxSound;
		
		[Embed(source="../assets/coin.mp3")] private var SoundEffectCoin:Class;
		[Embed(source="../assets/cautiouspath.mp3")] private var backgroundMusic:Class;
		[Embed(source="../assets/hit.mp3")] private var hitByArrowMusic:Class;
		[Embed(source="../assets/die.mp3")] private var dieMusic:Class;
		override public function create():void 
		{
			super.create();
			backGroundMusicPlaying = FlxG.play(backgroundMusic, 1.0,true);
			
			arrow = new Arrow()
			add(arrow);
			
			level = new Level();
			add(level);
			
			scores = new Dictionary();

			coins = createCoinGroup(0xffffff00, 41);
			enemies = createGoblinsFor(0xff003366,3);
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
			
			if (FlxG.keys.SPACE) {
				if (arrow.alive == false) {
					player.ShootArrow(arrow);
				}
			}
			
			FlxG.collide(player, level);
			FlxG.collide(coins, level,enemyCollideWithLevel);
			FlxG.collide(enemies, level, enemyCollideWithLevel);
			FlxG.overlap(enemies, player,enemyCollideWithPlayer);
			FlxG.overlap(coins, player, collectCoin);
			FlxG.overlap(coins, enemies, collectCoinForEnemyGroup);
			FlxG.collide(enemies, arrow, enemyCollideWithArrow);
			FlxG.collide(arrow, level, function (arrow:FlxSprite, level:FlxTilemap):void { arrow.kill(); } );
			
			updateScore();
			updateHealth();
			UpdateAnimations();
			EndGame();
			
			Restart();
		}
		
		private function Restart():void {
			if (isGameOver && FlxG.keys.X) {
				backGroundMusicPlaying.stop();
				FlxG.switchState(new PlayState());
			}
		}
		
		private function UpdateAnimations():void {
			player.UpdateDirection();
			arrow.UpdateDirection();
			enemies.callAll("UpdateDirection", false);		
		}
		
		private function EndGame():void {
			if(coins.countDead() == coins.length || !player.alive){
				var loseText:FlxText;
				if (!player.alive) { 
					gameOver("You lose. :(",0xff990033);
				}
				else if (scores[player] < scores[enemies]) {
					gameOver("You lose. The goblins collected more coins :(",0xff990033);
				}
				else if(enemies.countDead() == enemies.length){
					gameOver("You Win. You collected more coins and killed the goblins :)",0xff003300);
				}
			}
		}
		
		private function gameOver(text:String,color:int):void {
			enemies.kill();
			coins.kill();
			
			var description:FlxText = new FlxText(0, FlxG.height / 3, FlxG.width, text);
			description.setFormat(null, 12, color, "center");
			add(description);
			
			isGameOver = true;
			var tryAgainText:FlxText = new FlxText(0, FlxG.height / 2, FlxG.width, "Press X to try again");
			tryAgainText.setFormat(null, 12, 0xff000000, "center");
			add(tryAgainText);
		}
		
		private function createGoblinsFor(color:uint,count:uint):FlxGroup {
			var group:FlxGroup = new FlxGroup();
			while(count != 0){
				group.add(new Goblin());
				count--;
			}
			return group;
		}
		
		private function createCoinGroup(color:uint,count:uint):FlxGroup {
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
		
		private function enemyCollideWithArrow(enemy:FlxSprite, arrow:FlxSprite):void {
				enemy.health -= 25;
				enemy.flicker(1);
				if (enemy.health == 0) {
						enemy.kill();
						FlxG.play(dieMusic, .3);
				}
				else{
					FlxG.play(hitByArrowMusic, 0.3);
				}
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
		
		private function enemyCollideWithPlayer(enemy:FlxSprite, player:FlxSprite):void {
			player.health -= 1;
			updateHealth();
			player.flicker(1);
			if(player.health == 0){
				player.kill();
				FlxG.play(dieMusic, .3);
			}
			else {
					FlxG.play(hitByArrowMusic, .5);
			}
			
		}
		
		private function MovePlayer():void 
		{
			if (FlxG.keys.RIGHT) {
				player.acceleration.x = player.maxVelocity.x * 4;
				player.facingLeft = false;
			}
			if (FlxG.keys.LEFT) {
				player.acceleration.x = -player.maxVelocity.x * 4;
				player.facingLeft = true;
			}
			if (FlxG.keys.UP) {
				player.acceleration.y = -player.maxVelocity.y * 4;
			}
			if (FlxG.keys.DOWN) {
				player.acceleration.y = player.maxVelocity.y * 4;
			}
		}
	}
}