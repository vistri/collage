/**
 * Created on 17.05.14.
 */
package mediators
{
	import events.CollageUpdatedEvent;
	import events.SearchEvent;

	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import views.SearchView;

	/**
	 * Mediator for <code>SearchView</code> which handles mouse click and key down event on search, also listens for
	 * collage update event.
	 */
	public class SearchMediator extends Mediator implements IMediator
	{
		[Inject]
		public var search:SearchView;

		public function SearchMediator()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			addViewListener(MouseEvent.CLICK, handleMouseClick);
			addViewListener(KeyboardEvent.KEY_DOWN, handleKeyDown);

			addContextListener(CollageUpdatedEvent.COLLAGE_UPDATED, handleCollageUpdate);
		}

		private function handleCollageUpdate(event:CollageUpdatedEvent):void
		{
			search.remove();
		}

		private function handleKeyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER && search.text.length != 0)
			{
				eventDispatcher.dispatchEvent(new SearchEvent(SearchEvent.SEARCH, search.text));

				removeViewListener(MouseEvent.CLICK, handleMouseClick);
				removeViewListener(KeyboardEvent.KEY_DOWN, handleKeyDown);

				search.showLoadingImagesText();
			}
		}

		private function handleMouseClick(event:MouseEvent):void
		{
			search.resetText();
		}
	}
}
