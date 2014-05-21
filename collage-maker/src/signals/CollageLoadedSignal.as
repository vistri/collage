/**
 * Created on 18.05.14.
 */
package signals
{
	import models.vo.Collage;

	import org.osflash.signals.Signal;

	/**
	 * Signal is dispatched when service has found and loaded images for collage.
	 */
	public class CollageLoadedSignal extends Signal
	{
		public function CollageLoadedSignal()
		{
			super(Collage);
		}
	}
}
