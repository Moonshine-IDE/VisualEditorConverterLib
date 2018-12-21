package events
{
	import flash.events.Event;

	public class ConverterEvent extends Event 
	{
		public static const CONVERSION_COMPLETED:String = "conversionCompleted";
		public static const UNKNOWN_CONVERSION_ITEM:String = "unknownConversionItem";
		
		private var _xHtmlOutput:XML;
		private var _itemName:String;

		public function ConverterEvent(type:String, xHtmlOutput:XML = null, itemName:String = null)
		{
			super(type, false, false);
			
			_xHtmlOutput = xHtmlOutput;
			_itemName = itemName;
		}
		
		public function get xHtmlOutput():XML
		{
			return _xHtmlOutput;
		}
		
		private function get itemName():String
		{
			return _itemName;
		}
	}
}