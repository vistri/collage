/**
 * Created on 17.05.14.
 */
package
{
	import commands.SearchImagesCommand;
	import commands.UpdateCollageCommand;

	import flash.display.DisplayObjectContainer;

	import mediators.ApplicationMediator;
	import mediators.CollageMediator;
	import mediators.ImageMediator;
	import mediators.SearchMediator;

	import models.CollageModel;

	import org.robotlegs.mvcs.SignalContext;

	import services.FlickrImagesSearchService;
	import services.IImagesSearchService;

	import signals.CollageLoadedSignal;
	import signals.CollageUpdatedSignal;
	import signals.ImageRemoveSignal;
	import signals.ImageSelectedSignal;
	import signals.SearchImagesSignal;

	import views.CollageView;
	import views.ImageView;
	import views.SearchView;

	/**
	 * Application context which maps command, models services and views.
	 */
	public class ApplicationContext extends SignalContext
	{
		public function ApplicationContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}

		/**
		 * @inheritDoc
		 */
		override public function startup():void
		{
			mapCommands();
			mapModels();
			mapServices();
			mapSignals();
			mapViews();

			super.startup();
		}

		private function mapSignals():void
		{
			injector.mapSingleton(CollageUpdatedSignal);
			injector.mapSingleton(ImageSelectedSignal);
			injector.mapSingleton(ImageRemoveSignal);
		}

		private function mapModels():void
		{
			injector.mapSingleton(CollageModel);
		}

		private function mapServices():void
		{
			injector.mapSingletonOf(IImagesSearchService, FlickrImagesSearchService);
		}

		private function mapCommands():void
		{
			signalCommandMap.mapSignalClass(SearchImagesSignal, SearchImagesCommand);
			signalCommandMap.mapSignalClass(CollageLoadedSignal, UpdateCollageCommand);
		}

		private function mapViews():void
		{
			mediatorMap.mapView(SearchView, SearchMediator);
			mediatorMap.mapView(CollageView, CollageMediator);
			mediatorMap.mapView(ImageView, ImageMediator);
			mediatorMap.mapView(Main, ApplicationMediator);
		}
	}
}
