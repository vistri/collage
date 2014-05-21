/**
 * Created on 18.05.14.
 */
package models
{
	import flash.display.Bitmap;

	import models.vo.Collage;

	import org.robotlegs.mvcs.Actor;

	import signals.CollageUpdatedSignal;
	import signals.ImageSelectedSignal;

	/**
	 * Model which holds data for collage and knows about last selected bitmap.
	 */
	public class CollageModel extends Actor
	{
		[Inject]
		public var collageUpdated:CollageUpdatedSignal;

		[Inject]
		public var imageSelected:ImageSelectedSignal;

		private var _collage:Collage;
		private var _selected:Bitmap;

		/**
		 * Set collage data and dispatch update event.
		 * @param value
		 */
		public function set collage(value:Collage):void
		{
			_collage = value;
			collageUpdated.dispatch();
		}

		/**
		 * Returns collage data.
		 */
		public function get collage():Collage
		{
			return _collage;
		}

		/**
		 * Returns last selected bitmap.
		 */
		public function get selected():Bitmap
		{
			return _selected;
		}

		/**
		 * Set last selected bitmap and dispatch image selected event.
		 * @param value
		 */
		public function set selected(value:Bitmap):void
		{
			_selected = value;
			imageSelected.dispatch();
		}
	}
}
