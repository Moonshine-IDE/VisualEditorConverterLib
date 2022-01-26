package components
{
    import components.ComponentBase;
    import interfaces.IComponent;

	public class Container extends ComponentBase implements IComponent
	{
		public static const ELEMENT_NAME:String = "Container";
		
		public function Container()
		{
			super();
		}
	
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			
		}

		public function toCode():XML
		{
			return null;
		}
	}
}