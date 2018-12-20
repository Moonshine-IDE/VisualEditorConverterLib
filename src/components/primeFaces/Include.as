package components.primeFaces
{
	import components.ComponentBase;
	
	import interfaces.components.IInclude;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;

	public class Include extends ComponentBase implements IInclude
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "include";
		public static const ELEMENT_NAME:String = "Include";
		
		private var _path:String;
		public function get path():String
		{
			return _path;
		}

		public function set path(value:String):void
		{
			_path = value;
		}		
			
		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			
			this.path = xml.@src;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@src = this.path;

			return xml;
		}
	}
}