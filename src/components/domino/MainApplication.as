package components.domino
{
    
	import components.ComponentBase;
	import interfaces.dominoComponents.IMainApplication;
	import interfaces.IRootComponent;
	import components.primeFaces.RootDiv;
	public class MainApplication extends RootDiv implements IMainApplication
	{
		public function MainApplication()
		{
			super();
		}

		private var _title:String;
		public function get title():String
		{
			return _title;
		}
		public function set title(value:String):void
		{
			_title = value;
		}
	}
}