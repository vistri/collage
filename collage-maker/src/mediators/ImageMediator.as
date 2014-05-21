/**
 * Created on 19.05.14.
 */
package mediators
{
	import flash.events.MouseEvent;

	import models.CollageModel;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import signals.ImageRemoveSignal;
	import signals.ImageSelectedSignal;

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

		[Inject]
		public var imageSelected:ImageSelectedSignal;

		[Inject]
		public var imageRemove:ImageRemoveSignal;

		public function ImageMediator()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			imageSelected.add(handleSelectedImageChanged);
			image.clicked.add(handleMouseClick);
		}

		private function handleSelectedImageChanged():void
		{
			//Make sure this is selected image
			if (image.bitmap == collageModel.selected)
			{
				imageRemove.dispatch(image);
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
