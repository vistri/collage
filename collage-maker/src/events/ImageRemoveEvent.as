/**
 * Created on 20.05.14.
 */
package events
{
	import flash.events.Event;

	import views.ImageView;

	/**
	 * Event is dispatched when selected image needs to be removed.
	 */
	public class ImageRemoveEvent extends Event
	{
		/**
		 * Defines the value of the type property of image remove event object.
		 */
		public static const REMOVE_IMAGE:String = "events.ImageRemoveEvent.REMOVE_IMAGE";

		/**
		 * Reference to image to remove.
		 */
		public var image:ImageView;

		public function ImageRemoveEvent(type:String, image:ImageView)
		{
			this.image = image;
			super(type, false, false);
		}

		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new ImageRemoveEvent(type, image);
		}
	}
}
