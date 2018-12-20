package components.primeFaces
{
	import components.ComponentBase;
	import interfaces.components.IInputText;
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import mx.utils.StringUtil;

	public class InputText extends ComponentBase implements IInputText
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "inputText";
        public static const ELEMENT_NAME:String = "InputText";

		public function InputText()
		{
			super();
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
		
		private var _text:String;
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}
		
		private var _maxLength:String;
		public function get maxLength():String
		{
			return _maxLength;
		}

		public function set maxLength(value:String):void
		{
			_maxLength = value;
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
		
		private var _required:Boolean;
		public function get required():Boolean
		{
			return _required;
		}

		public function set required(value:Boolean):void
		{
			_required = value;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			
			this.text = xml.@value;
			this.maxLength = xml.@maxlength;
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

            xml.@required = this.required;
			
			if ((StringUtil.trim(maxLength).length != 0) && Math.round(Number(maxLength)) != 0)
			{
				xml.@maxlength = this.maxLength;
			}

            if (this.idAttribute)
            {
                xml.@id = this.idAttribute;
            }

            return xml;
		}
	}
}