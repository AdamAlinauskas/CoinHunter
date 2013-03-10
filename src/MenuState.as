package  
{
	/**
	 * ...
	 * @author Adam
	 */
	import org.flixel.*;
    public class MenuState extends FlxState
    {
        override public function MenuState():void
	{
		var txt:FlxText
		txt = new FlxText(0, (FlxG.height / 2) - 80, FlxG.width, "Coin hunter")
		txt.setFormat(null, 16, 0xffFFCC00, "center")
		this.add(txt);
		
		txt = new FlxText(0, (FlxG.height / 2) , FlxG.width, "To win collect more coins than the goblins.")
		txt.setFormat(null, 8, 0xFFFFFFFF, "center")
		this.add(txt);
		
		txt = new FlxText(0, (FlxG.height / 2) + 10, FlxG.width, "Then kill the remaining goblins using your arrows.")
		txt.setFormat(null, 8, 0xFFFFFFFF, "center")
		this.add(txt);
		
		txt = new FlxText(0, (FlxG.height / 2) + 50 , FlxG.width, "Arrow keys to move and space bar to shoot.")
		txt.setFormat(null, 8, 0xFFFFFFFF, "center")
		this.add(txt);
		
		txt = new FlxText(0, FlxG.height  -24, FlxG.width, "PRESS ANY KEY TO START")
		txt.setFormat(null, 8, 0xFFCC0000, "center");
		this.add(txt);
        }
        override public function update():void
        {
            if (FlxG.keys.any())
            {
                FlxG.flash(0xffffffff, 0.75);
                FlxG.fade(0xff000000, 1, onFade);
            }
            super.update();
        }
        private function onFade():void
        {
			FlxG.switchState(new PlayState());
        }
    }

}