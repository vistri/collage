/**
 * Created on 18.05.14.
 */
package views
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * Class represents one image in collage.
	 */
	public class ImageView extends Sprite
	{
		private var _bitmap:Bitmap;

		public function ImageView(bitmap:Bitmap)
		{
			_bitmap = bitmap;

			mouseEnabled = true;
			buttonMode = true;

			addChild(bitmap);
		}

		/**
		 * Returns bitmap which is used for this image.
		 */
		public function get bitmap():Bitmap
		{
			return _bitmap;
		}

		/**
		 * Remove user input interactivity from image.
		 */
		public function disable():void
		{
			mouseEnabled = false;
			buttonMode = false;
		}
	}
}
