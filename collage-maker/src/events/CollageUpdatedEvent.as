/**
 * Created on 18.05.14.
 */
package events
{
	import flash.events.Event;

	/**
	 * Event is dispatched when collage property of collage model is updated.
	 */
	public class CollageUpdatedEvent extends Event
	{
		/**
		 * Defines the value of the type property of a collage update event object.
		 */
		public static const COLLAGE_UPDATED:String = "events.CollageUpdatedEvent.COLLAGE_UPDATED";

		public function CollageUpdatedEvent(type:String)
		{
			super(type, false, false);
		}

		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new CollageUpdatedEvent(type);
		}
	}
}
