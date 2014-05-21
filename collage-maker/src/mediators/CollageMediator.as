/**
 * Created on 18.05.14.
 */
package mediators
{
	import com.greensock.TweenLite;

	import events.CollageUpdatedEvent;
	import events.ImageRemoveEvent;

	import flash.display.Bitmap;

	import models.CollageModel;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import views.CollageView;
	import views.ImageView;

	/**
	 * Mediator for <code>CollageView</code> which listens for image remove and collage update events.
	 */
	public class CollageMediator extends Mediator implements IMediator
	{
		private static const IMAGE_REMOVING_ANIMATION_DURATION:Number = 0.5;

		[Inject]
		public var collage:CollageView;

		[Inject]
		public var collageModel:CollageModel;

		public function CollageMediator()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, CollageUpdatedEvent.COLLAGE_UPDATED, handleCollageUpdate);

			addContextListener(ImageRemoveEvent.REMOVE_IMAGE, handleImageRemove);
		}

		private function handleImageRemove(event:ImageRemoveEvent):void
		{
			TweenLite.to(event.image, IMAGE_REMOVING_ANIMATION_DURATION, {alpha: 0})
					.eventCallback("onComplete", removeChild, [event.image]);
		}

		private function removeChild(image:ImageView):void
		{
			collage.removeChild(image);

			image.removeChild(image.bitmap);
			image.bitmap.bitmapData.dispose();
		}

		private function handleCollageUpdate(event:CollageUpdatedEvent):void
		{
			for each (var bitmap:Bitmap in collageModel.collage.images)
			{
				collage.addImage(bitmap);
			}
		}
	}
}
