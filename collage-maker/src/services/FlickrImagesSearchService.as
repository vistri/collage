/**
 * Created on 17.05.14.
 */
package services
{
	import com.adobe.webapis.flickr.FlickrService;
	import com.adobe.webapis.flickr.Photo;
	import com.adobe.webapis.flickr.events.FlickrResultEvent;
	import com.adobe.webapis.flickr.methodgroups.Photos;

	import events.CollageLoadedEvent;

	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;

	import models.vo.Collage;

	import org.robotlegs.mvcs.Actor;

	/**
	 * Service makes images search on Flickr.
	 */
	public class FlickrImagesSearchService extends Actor implements IImagesSearchService
	{
		private static const FLICKR_API_KEY:String = "516ab798392cb79523691e6dd79005c2";

		private var _service:FlickrService;
		private var _photos:Photos;
		private var _totalLoadRequests:int;
		private var _loadRequestHandled:int = 0;
		private var _collage:Collage = new Collage();

		public function FlickrImagesSearchService()
		{
			_service = new FlickrService(FLICKR_API_KEY);

		}

		/**
		 * @inheritDoc
		 */
		public function search(searchTerm:String):void
		{
			if (!_photos)
			{
				_photos = new Photos(_service);
			}

			_service.addEventListener(FlickrResultEvent.PHOTOS_SEARCH, handlePhotosSearchResult);
			_photos.search("", "", "any", searchTerm);
		}

		private function handlePhotosSearchResult(event:FlickrResultEvent):void
		{
			processPhotosSearchResult(event.data.photos.photos);
		}

		private function processPhotosSearchResult(photos:Array):void
		{
			var urls:Vector.<String> = new <String>[];

			for each (var photo:Photo in photos)
			{
				var url:String = "http://farm1.staticflickr.com/" + photo.server + "/" + photo.id + "_" + photo.secret
						+ "_q.jpg";
				urls.push(url);
			}

			loadImages(urls);
		}

		private function loadImages(urls:Vector.<String>):void
		{
			_totalLoadRequests = urls.length;
			for each (var url:String in urls)
			{
				loadImage(url);
			}
		}

		private function loadImage(url:String):void
		{
			var urlRequest:URLRequest = new URLRequest(url);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoadComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, handleLoadError);
			loader.load(urlRequest);
		}

		private function handleLoadError(event:IOErrorEvent):void
		{
			removeLoaderListeners(event.target as LoaderInfo);
			checkAmountOfHandledRequest();
		}

		private function checkAmountOfHandledRequest():void
		{
			if (_loadRequestHandled == _totalLoadRequests)
			{
				dispatch(new CollageLoadedEvent(CollageLoadedEvent.COLLAGE_LOADED, _collage));
			}
			trace("Images loaded: " + _loadRequestHandled + "/" + _totalLoadRequests);
		}

		private function removeLoaderListeners(loaderInfo:LoaderInfo):void
		{
			loaderInfo.removeEventListener(Event.COMPLETE, handleLoadComplete);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, handleLoadError);
			_loadRequestHandled++;
		}

		private function handleLoadComplete(event:Event):void
		{
			removeLoaderListeners(event.target as LoaderInfo);
			_collage.images.push(event.target.content);
			checkAmountOfHandledRequest();
		}
	}
}
