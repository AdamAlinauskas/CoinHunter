package  
{
	import org.flixel.*;
	
	public class Level extends FlxTilemap
	{
		var levelWidth:int = 50;
		var levelHeight:int = 38;
		var levelArray:Array;
		
		public function Level() 
		{
			buildMe();
		}
		
		private function buildMe():void
		{
			FlxG.bgColor = 0xff758575;
			levelArray = new Array();
			solidRow();
			for (var i:int = 0; i < levelHeight-2; i++) {
				addRow();			
			}
			solidRow();
			
			loadMap(FlxTilemap.arrayToCSV(levelArray, 50), FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
		}
		
		private function addRow():void {
				for (var i:int = 0; i < levelWidth; i++) {
						levelArray.push(i==0 || i==levelWidth-1 ? 1 :0);
				}
		}
		
		private function solidRow():void {
				for (var i:int = 0; i < levelWidth; i++) {
						levelArray.push(1);
				}
		}
	}
}