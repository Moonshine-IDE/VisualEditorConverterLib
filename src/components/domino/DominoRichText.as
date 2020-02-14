package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoRichText;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	public class DominoRichText extends ComponentBase implements IDominoRichText
	{
		public static const DOMINO_ELEMENT_NAME:String = "richtext";
        public static const ELEMENT_NAME:String = "Richtext";

		public function DominoRichText()
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


		// private var _nameAttribute:String;
		// public function get nameAttribute():String
		// {
		// 	return _nameAttribute;
		// }
		// public function set nameAttribute(value:String):void
		// {
		// 	_nameAttribute = value;
		// }
		
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
			//this.nameAttribute = xml.@nameAttribute;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
            // var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            // xml.addNamespace(primeFacesNamespace);
            // xml.setNamespace(primeFacesNamespace);

			CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			
			if (this.text)
            {
                xml.@value = this.text;
            }

            xml.@required = this.required;

			var stringHelper:StringHelperUtils = new StringHelperUtils();
			
			if ((stringHelper.trim(maxLength, " ").length != 0) && Math.round(Number(maxLength)) != 0)
			{
				xml.@maxlength = this.maxLength;
			}

            if (this.idAttribute)
            {
                xml.@id = this.idAttribute;
            }

			// if(this.nameAttribute)
			// {
			// 	xml.@name = this.nameAttribute;
			// }

            return xml;
		}
	}
}