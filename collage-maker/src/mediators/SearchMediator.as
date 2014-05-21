/**
 * Created on 17.05.14.
 */
package mediators
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import signals.CollageUpdatedSignal;
	import signals.SearchImagesSignal;

	import views.SearchView;

	/**
	 * Mediator for <code>SearchView</code> which handles mouse click and key down event on search, also listens for
	 * collage update event.
	 */
	public class SearchMediator extends Mediator implements IMediator
	{
		[Inject]
		public var search:SearchView;

		[Inject]
		public var searchImages:SearchImagesSignal;

		[Inject]
		public var collageUpdated:CollageUpdatedSignal;

		public function SearchMediator()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			collageUpdated.add(handleCollageUpdate);
			search.clicked.add(handleMouseClick);
			search.keyPressed.add(handleKeyDown);
		}

		private function handleCollageUpdate():void
		{
			search.remove();
		}

		private function handleKeyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER && search.text.length != 0)
			{
				searchImages.dispatch(search.text);

				search.clicked.remove(handleMouseClick);
				search.keyPressed.remove(handleKeyDown);

				search.showLoadingImagesText();
			}
		}

		private function handleMouseClick(event:MouseEvent):void
		{
			search.resetText();
		}
	}
}
