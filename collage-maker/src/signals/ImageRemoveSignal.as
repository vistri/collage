/**
 * Created on 20.05.14.
 */
package signals
{
	import org.osflash.signals.Signal;

	import views.ImageView;

	/**
	 * Signal is dispatched when selected image needs to be removed.
	 */
	public class ImageRemoveSignal extends Signal
	{
		public function ImageRemoveSignal()
		{
			super(ImageView);
		}
	}
}
