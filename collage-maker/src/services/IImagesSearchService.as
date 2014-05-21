/**
 * Created on 17.05.14.
 */
package services
{
	/**
	 * Interface provides search functionality on service.
	 */
	public interface IImagesSearchService
	{
		/**
		 * Makes search request on service with provided <code>searchTerm</code>.
		 * @param searchTerm
		 */
		function search(searchTerm:String):void;
	}
}
