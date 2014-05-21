/**
 * Created on 17.05.14.
 */
package events
{
	import flash.events.Event;

	/**
	 * Event is dispatched when search term is provided in text input field and enter key is pressed.
	 */
	public class SearchEvent extends Event
	{
		/**
		 * Defines the value of the type property of a search event object.
		 */
		public static const SEARCH:String = "events.SearchEvent.SEARCH";

		/**
		 * Search term provided in text input field.
		 */
		public var searchTerm:String;

		public function SearchEvent(type:String, searchTerm:String)
		{
			this.searchTerm = searchTerm;
			super(type, false, false);
		}

		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new SearchEvent(type, searchTerm);
		}
	}
}
