package components
{
    import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.ISurface;

	public class Container extends ComponentBase implements IComponent
	{
		public static const ELEMENT_NAME:String = "Container";
		
		public function Container()
		{
			super();
		}
	
		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			
		}

		public function toCode():XML
		{
			return null;
		}
	}
}