package components
{
    import interfaces.IComponent;
	import interfaces.ILookup;

	public class Container extends ComponentBase implements IComponent
	{
		public static const ELEMENT_NAME:String = "Container";
		
		public function Container()
		{
			super();
		}
	
		public function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void
		{
			
		}

		public function toCode():XML
		{
			return null;
		}
	}
}