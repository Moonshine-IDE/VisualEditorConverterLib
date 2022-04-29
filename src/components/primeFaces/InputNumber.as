package components.primeFaces
{
	import interfaces.ILookup;
	import interfaces.ISurface;

	import mx.formatters.NumberBaseRoundType;
	
	import components.ComponentBase;
	
	import interfaces.components.IInputNumber;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.InputNumberFormatter;
	
	public class InputNumber extends ComponentBase implements IInputNumber
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "inputNumber";
		public static const ELEMENT_NAME:String = "InputNumber";
		
		private var _formatter:InputNumberFormatter;
		
		public function InputNumber()
		{
			super();
			
			_formatter = new InputNumberFormatter();
			_formatter.useThousandsSeparator = true;
			_formatter.rounding = NumberBaseRoundType.NONE;
			_formatter.precision = -1;
		}
		
		private var _text:String;
		public function set text(value:String):void
		{
			_text = value;
		}
		public function get text():String
		{
			return _text;
		}	
		
		private var _thousandSeparator:String = "";
		public function get thousandSeparator():String
		{
			return _thousandSeparator;
		}
		public function set thousandSeparator(value:String):void
		{
			_thousandSeparator = value;
		}
		
		private var _decimalSeparator:String = "";
		public function get decimalSeparator():String
		{
			return _decimalSeparator;
		}
		public function set decimalSeparator(value:String):void
		{
			_decimalSeparator = value;
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

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);
			
			this.thousandSeparator = xml.@thousandSeparator;
			this.decimalSeparator = xml.@decimalSeparator;
			this.idAttribute = xml.@id;
			this.required = xml.@required == "true";
			
			var newTextValue:String = xml.@value;
			if (this.thousandSeparator)
			{
				var thousandsSeparatorReg:RegExp = new RegExp('\\' + this.thousandSeparator, "g");
				newTextValue = newTextValue.replace(thousandsSeparatorReg, "");
			}
			
			this.refreshText(newTextValue);
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
			xml.@thousandSeparator = this.thousandSeparator;
			xml.@decimalSeparator = this.decimalSeparator;
			xml.@required = this.required;
			
			if (this.idAttribute)
			{
				xml.@id = this.idAttribute;
			}
			
			return xml;
		}

		private function refreshText(value:String):void
		{
			if (value == "0" || value == "0.00" || !value)
			{
				text = this.decimalSeparator ? "0.00".replace(".", this.decimalSeparator) : "0.00";
			}
			else
			{
				text = _formatter.format(value);
			}
		}
	}
}