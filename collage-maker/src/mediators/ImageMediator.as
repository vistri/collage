/**
 * Created on 19.05.14.
 */
package mediators
{
	import events.ImageRemoveEvent;
	import events.ImageSelectedEvent;

	import flash.events.MouseEvent;

	import models.CollageModel;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import views.ImageView;

	/**
	 * Mediator for <code>ImageView</code> which handles mouse click on image, also listens for
	 * image selected event.
	 */
	public class ImageMediator extends Mediator implements IMediator
	{
		[Inject]
		public var image:ImageView;

		[Inject]
		public var collageModel:CollageModel;

		public function ImageMediator()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			addViewListener(MouseEvent.CLICK, handleMouseClick);

			addContextListener(ImageSelectedEvent.IMAGE_SELECTED, handleSelectedImageChanged)
		}

		private function handleSelectedImageChanged(event:ImageSelectedEvent):void
		{
			//Make sure this is selected image
			if (image.bitmap == collageModel.selected)
			{
				dispatch(new ImageRemoveEvent(ImageRemoveEvent.REMOVE_IMAGE, image));
			}
		}

		private function handleMouseClick(event:MouseEvent):void
		{
			image.disable();
			trace("Image clicked");
			collageModel.selected = (event.target as ImageView).bitmap;
		}
	}
}
