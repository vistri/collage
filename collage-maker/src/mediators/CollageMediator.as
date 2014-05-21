/**
 * Created on 18.05.14.
 */
package mediators
{
	import com.greensock.TweenLite;

	import flash.display.Bitmap;

	import models.CollageModel;

	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	import signals.CollageUpdatedSignal;
	import signals.ImageRemoveSignal;

	import views.CollageView;
	import views.ImageView;

	/**
	 * Mediator for <code>CollageView</code> which listens for image remove and collage update signals.
	 */
	public class CollageMediator extends Mediator implements IMediator
	{
		private static const IMAGE_REMOVING_ANIMATION_DURATION:Number = 0.5;

		[Inject]
		public var collage:CollageView;

		[Inject]
		public var collageModel:CollageModel;

		[Inject]
		public var collageUpdated:CollageUpdatedSignal;

		[Inject]
		public var imageRemove:ImageRemoveSignal;

		public function CollageMediator()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			collageUpdated.add(handleCollageUpdate);
			imageRemove.add(handleImageRemove);
		}

		private function handleImageRemove(image:ImageView):void
		{
			TweenLite.to(image, IMAGE_REMOVING_ANIMATION_DURATION, {alpha: 0})
					.eventCallback("onComplete", removeChild, [image]);
		}

		private function removeChild(image:ImageView):void
		{
			collage.removeChild(image);

			image.removeChild(image.bitmap);
			image.bitmap.bitmapData.dispose();
		}

		private function handleCollageUpdate():void
		{
			for each (var bitmap:Bitmap in collageModel.collage.images)
			{
				collage.addImage(bitmap);
			}
		}
	}
}
