/**
 * Created on 18.05.14.
 */
package commands
{
	import models.CollageModel;
	import models.vo.Collage;

	import org.robotlegs.mvcs.Command;

	/**
	 * Command updated collage model.
	 */
	public class UpdateCollageCommand extends Command
	{
		[Inject]
		public var collage:Collage;

		[Inject]
		public var collageModel:CollageModel;

		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			collageModel.collage = collage;
		}
	}
}
