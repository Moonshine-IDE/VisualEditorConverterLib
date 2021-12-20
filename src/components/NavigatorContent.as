package components
{
	public class NavigatorContent extends Container 
	{
		public static const NAVIGATORCONTENT_NAME:String = "NavigatorContent";
		
		public function NavigatorContent()
		{
			super();
		}
		
		private var _label:String;

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}
		// public function toRoyaleConvertCode():XML
		// {	
		// 	return null;

		// }
	}
}