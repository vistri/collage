/**
 * Created on 17.05.14.
 */
package commands
{
	import events.SearchEvent;

	import org.robotlegs.mvcs.Command;

	import services.IImagesSearchService;

	/**
	 * Command makes search of images with provided search term on service.
	 */
	public class SearchImagesCommand extends Command
	{
		[Inject]
		public var event:SearchEvent;

		[Inject]
		public var service:IImagesSearchService;

		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			service.search(event.searchTerm);
		}
	}
}
