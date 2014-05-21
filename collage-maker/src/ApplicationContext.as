/**
 * Created on 17.05.14.
 */
package
{
	import commands.SearchImagesCommand;
	import commands.UpdateCollageCommand;

	import events.CollageLoadedEvent;
	import events.SearchEvent;

	import flash.display.DisplayObjectContainer;

	import mediators.ApplicationMediator;
	import mediators.CollageMediator;
	import mediators.ImageMediator;
	import mediators.SearchMediator;

	import models.CollageModel;

	import org.robotlegs.mvcs.Context;

	import services.FlickrImagesSearchService;
	import services.IImagesSearchService;

	import views.CollageView;
	import views.ImageView;
	import views.SearchView;

	/**
	 * Application context which maps command, models services and views.
	 */
	public class ApplicationContext extends Context
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
			mapViews();

			super.startup();
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
			commandMap.mapEvent(SearchEvent.SEARCH, SearchImagesCommand, SearchEvent);
			commandMap.mapEvent(CollageLoadedEvent.COLLAGE_LOADED, UpdateCollageCommand, CollageLoadedEvent);
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
