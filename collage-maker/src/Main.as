package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import views.CollageView;
	import views.SearchView;

	/**
	 * Main class of collage application which also holds reference to application context.
	 */
	public class Main extends Sprite
	{
		private var _context:ApplicationContext;

		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			_context = new ApplicationContext(this);
		}

		/**
		 * Adds search and collage view to stage.
		 */
		public function createChildren():void
		{
			addChild(new SearchView());
			addChild(new CollageView());
		}
	}
}
