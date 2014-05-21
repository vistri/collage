/**
 * Created on 19.05.14.
 */
package events
{
	import flash.display.Bitmap;
	import flash.events.Event;

	/**
	 * Event is dispatched when selected property of collage model is updated.
	 */
	public class ImageSelectedEvent extends Event
	{
		/**
		 * Defines the value of the type property of image selected event object.
		 */
		public static const IMAGE_SELECTED:String = "events.ImageSelectedEvent.IMAGE_SELECTED";

		/**
		 * Reference to selected image (bitmap).
		 */
		public var image:Bitmap;

		public function ImageSelectedEvent(type:String, image:Bitmap = null)
		{
			this.image = image;
			super(type, false, false);
		}

		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new ImageSelectedEvent(type, image);
		}
	}
}
