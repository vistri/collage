/**
 * Created on 18.05.14.
 */
package events
{
	import flash.events.Event;

	import models.vo.Collage;

	/**
	 * Event is dispatched when service has found and loaded images for collage.
	 */
	public class CollageLoadedEvent extends Event
	{
		/**
		 * Defines the value of the type property of a collage loaded event object.
		 */
		public static const COLLAGE_LOADED:String = "events.CollageLoadedEvent.COLLAGE_LOADED";

		/**
		 * Object which hold all loaded images.
		 */
		public var collage:Collage;

		public function CollageLoadedEvent(type:String, collage:Collage = null)
		{
			this.collage = collage;
			super(type, false, false);
		}

		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new CollageLoadedEvent(type, collage);
		}
	}
}
