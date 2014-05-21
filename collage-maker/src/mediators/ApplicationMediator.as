/**
 * Created on 19.05.14.
 */
package mediators
{
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * Mediator for <code>Main</code> class which adds children on stage.
	 */
	public class ApplicationMediator extends Mediator implements IMediator
	{
		[Inject]
		public var view:Main;

		public function ApplicationMediator()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			view.createChildren();
		}
	}
}
