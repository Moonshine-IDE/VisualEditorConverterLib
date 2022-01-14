
package events
{
	import flash.events.Event;

	public class ConverterErrorEvent extends Event 
	{
		public static const CONVERSION_FAILED:String = "conversionFailed";
		
		public function ConverterErrorEvent(errorMessage:String)
		{
			super(CONVERSION_FAILED, false, false);
			
			_errorMessage = errorMessage;
		}
		
		private var _errorMessage:String;

		public function get errorMessage():String
		{
			return _errorMessage;
		}
	}
}