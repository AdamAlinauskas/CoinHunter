package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class BloodBitMap extends Bitmap
	{
		/****/
		public function BloodBitMap()
		{
			super(new BitmapData(16, 2, false, 0x000000));
			
			bitmapData.fillRect(new Rectangle(0, 0, 2, 2), 0xB20000);
			bitmapData.fillRect(new Rectangle(2, 0, 2, 2), 0xA30000);
			bitmapData.fillRect(new Rectangle(4, 0, 2, 2), 0xB20000);
			bitmapData.fillRect(new Rectangle(6, 0, 2, 2), 0x8F0000);
			bitmapData.fillRect(new Rectangle(8, 0, 2, 2), 0x990000);
			bitmapData.fillRect(new Rectangle(10, 0, 2, 2), 0xC26666);
			bitmapData.fillRect(new Rectangle(12, 0, 2, 2), 0xC26666);
			bitmapData.fillRect(new Rectangle(14, 0, 2, 2), 0x590000);
		}
	}

}