/**
 * Created on 18.05.14.
 */
package views
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * Class represents view which shows all images on stage.
	 */
	public class CollageView extends Sprite
	{
		private var _imageXPosition:int = 0;
		private var _imageYPosition:int = 0;
		private var _isCollageFull:Boolean = false;

		public function CollageView()
		{
			super();
		}

		/**
		 * Add provided <code>bitmap</code> to collage view.
		 * @param bitmap
		 */
		public function addImage(bitmap:Bitmap):void
		{
			if (_isCollageFull)
			{
				return;
			}

			var image:ImageView = new ImageView(bitmap);
			addChild(image);

			updateImagePosition(image);
		}

		private function updateImagePosition(image:ImageView):void
		{
			image.x = _imageXPosition * image.width;
			image.y = _imageYPosition * image.height;
			_imageXPosition++;

			if (image.x + image.width * 2 > stage.stageWidth)
			{
				_imageXPosition = 0;
				_imageYPosition++;

				if (image.y + image.height * 2 > stage.stageHeight)
				{
					_isCollageFull = true;
				}
			}
		}
	}
}
