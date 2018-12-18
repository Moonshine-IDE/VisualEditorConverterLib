package events
{
	import flash.events.Event;

	public class ConverterEvent extends Event 
	{
		public static const CONVERSION_COMPLETED:String = "conversionCompleted";
		
		private var _xHtmlOutput:XML;

		public function ConverterEvent(type:String, xHtmlOutput:XML = null)
		{
			super(type, false, false);
			
			this._xHtmlOutput = xHtmlOutput;
		}
		
		public function get xHtmlOutput():XML
		{
			return _xHtmlOutput;
		}
	}
}