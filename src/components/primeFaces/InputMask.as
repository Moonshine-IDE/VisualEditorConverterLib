package components.primeFaces
{
	import components.ComponentBase;
	
	import interfaces.components.IInputMask;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class InputMask extends ComponentBase implements IInputMask
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "inputMask";
		public static const ELEMENT_NAME:String = "InputMask";
		
		private var _text:String;
		public function set text(value:String):void
		{
			_text = value;
		}
		public function get text():String
		{
			return _text;
		}	
		
		private var _maskText:String = "";
		public function get maskText():String
		{
			return _maskText;
		}
		public function set maskText(value:String):void
		{
			_maskText = value;
		}
		
		private var _required:Boolean;
		public function get required():Boolean
		{
			return _required;
		}
		public function set required(value:Boolean):void
		{
			_required = value;
		}
		
		private var _idAttribute:String;
		public function get idAttribute():String
		{
			return _idAttribute;
		}
		public function set idAttribute(value:String):void
		{
			_idAttribute = value;
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
			
			this.maskText = xml.@mask;
			this.text = xml.@value;
			this.idAttribute = xml.@id;
			this.required = xml.@required == "true";
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			if (this.text)
			{
				xml.@value = this.text;
			}
			
			xml.@mask = this.maskText;
			xml.@required = this.required;
			
			if (this.idAttribute)
			{
				xml.@id = this.idAttribute;
			}
			
			return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}
	}
}