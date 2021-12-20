package components.primeFaces
{
	import components.ComponentBase;
	
	import interfaces.components.IOutputLabel;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;

	public class OutputLabel extends ComponentBase implements IOutputLabel
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "outputLabel";
		public static const ELEMENT_NAME:String = "OutputLabel";
		
		private var _indicateRequired:Boolean;
		public function get indicateRequired():Boolean
		{
			return _indicateRequired;
		}

		public function set indicateRequired(value:Boolean):void
		{
			_indicateRequired = value;
		}
		
		private var _text:String;
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}		
		
		private var _forAttribute:String;
		public function get forAttribute():String
		{
			return _forAttribute;
		}

		public function set forAttribute(value:String):void
		{
			_forAttribute = value;
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
			
            this.text = xml.@value;
			this.forAttribute = xml["@for"];
			this.indicateRequired = xml.@indicateRequired == "true";
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

            xml.@value = this.text;
			if (this.forAttribute)
			{
				xml["@for"] = this.forAttribute;
			}

			return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}
	}
}