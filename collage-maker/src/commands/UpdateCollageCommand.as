/**
 * Created on 18.05.14.
 */
package commands
{
	import events.CollageLoadedEvent;

	import models.CollageModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * Command updated collage model.
	 */
	public class UpdateCollageCommand extends Command
	{
		[Inject]
		public var event:CollageLoadedEvent;

		[Inject]
		public var collageModel:CollageModel;

		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			collageModel.collage = event.collage;
		}
	}
}
