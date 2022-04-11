package components.primeFaces
{
    import components.ComponentBase;

	import interfaces.ILookup;
	import interfaces.components.IAutoCompleteDropDownList;
    import utils.CodeMxmlUtils;
    import utils.CodeXMLUtils;

	public class AutoCompleteDropDownList extends ComponentBase implements IAutoCompleteDropDownList
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "autoComplete";
        public static const ELEMENT_NAME:String = "DropDownList";

		public function AutoCompleteDropDownList()
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
		
		private var _value:String;
		public function get value():String
		{
			return _value;
		}

		public function set value(value:String):void
		{
			_value = value;
		}
		
		private var _fieldVar:String;
		public function get fieldVar():String
		{
			return _fieldVar;
		}

		public function set fieldVar(value:String):void
		{
			_fieldVar = value;
		}
		
		private var _multiple:Boolean;
		public function get multiple():Boolean
		{
			return _multiple;
		}

		public function set multiple(value:Boolean):void
		{
			_multiple = value;
		}
		
		private var _completeMethod:String;
		public function get completeMethod():String
		{
			return _completeMethod;
		}

		public function set completeMethod(value:String):void
		{
			_completeMethod = value;
		}
		
		private var _itemLabel:String;
		public function get itemLabel():String
		{
			return _itemLabel;
		}

		public function set itemLabel(value:String):void
		{
			_itemLabel = value;
		}
		
		private var _itemValue:String;
		public function get itemValue():String
		{
			return _itemValue;
		}

		public function set itemValue(value:String):void
		{
			_itemValue = value;
		}
		
		private var _converter:String;
		public function get converter():String
		{
			return _converter;
		}

		public function set converter(value:String):void
		{
			_converter = value;
		}
		
		private var _isDropDown:Boolean;
		public function get isDropDown():Boolean
		{
			return _isDropDown;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void
		{
			this.setComponentSize(xml);
			
			this.value = xml.@value;
            this.fieldVar = xml.@['var'];

            this.multiple = xml.@multiple == "true";

			this.completeMethod = xml.@completeMethod;
			this.itemLabel = xml.@itemLabel;
			this.itemValue = xml.@itemValue;
			this.converter = xml.@converter;
			this._isDropDown = true;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            xml.@dropdown = this.isDropDown;
            xml.@multiple = this.multiple;
			
			xml.@value = this.value;
            xml.@['var'] = this.fieldVar;

			if (this.completeMethod)
            {
                xml.@completeMethod = this.completeMethod;
            }

			if (this.itemLabel)
			{
				xml.@itemLabel = this.itemLabel;
            }

			if (this.itemValue)
			{
				xml.@itemValue = this.itemValue;
            }

			if (this.converter)
			{
				xml.@converter = this.converter;
            }

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

            return xml;
		}
	}
}