/**
 * Created on 17.05.14.
 */
package views
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	/**
	 * Class represents text input field which allows to provide search term for our collage application.
	 */
	public class SearchView extends Sprite
	{
		private static const INITIAL_TEXT:String = "Search in Flickr";
		private static const SEARCHING_FOR_IMAGES_TEXT:String = "Searching for images ...";

		private var _searchInput:TextField;

		public function SearchView()
		{
			init();
		}

		private function init():void
		{
			_searchInput = new TextField();
			_searchInput.type = TextFieldType.INPUT;
			_searchInput.border = true;
			_searchInput.text = INITIAL_TEXT;
			_searchInput.height = 20;
			_searchInput.width = 200;

			addChild(_searchInput);
		}

		/**
		 * Resets text in search field.
		 */
		public function resetText():void
		{
			_searchInput.text = "";
		}

		/**
		 * Returns text typed in search filed.
		 */
		public function get text():String
		{
			return _searchInput.text;
		}

		/**
		 * Changes text field to showing loading images text.
		 */
		public function showLoadingImagesText():void
		{
			_searchInput.type = TextFieldType.DYNAMIC;
			_searchInput.border = false;
			_searchInput.text = SEARCHING_FOR_IMAGES_TEXT;
		}

		/**
		 * Removes text field from stage.
		 */
		public function remove():void
		{
			removeChild(_searchInput);
		}
	}
}
