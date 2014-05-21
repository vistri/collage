/**
 * Created on 17.05.14.
 */
package signals
{
	import org.osflash.signals.Signal;

	/**
	 * Signal is dispatched when search term is provided in text input field and enter key is pressed.
	 */
	public class SearchImagesSignal extends Signal
	{
		public function SearchImagesSignal()
		{
			super(String);
		}
	}
}
