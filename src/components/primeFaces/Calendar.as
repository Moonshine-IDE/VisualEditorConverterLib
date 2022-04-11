package components.primeFaces
{
	import components.ComponentBase;

	import interfaces.ILookup;
	import interfaces.components.ICalendar;
	import utils.CodeXMLUtils;
	import utils.CodeMxmlUtils;

	public class Calendar extends ComponentBase implements ICalendar
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "calendar";
        public static const ELEMENT_NAME:String = "Calendar";

		public function Calendar()
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
		
		private var _pattern:String = "MM/dd/yyyy";
		public function get pattern():String
		{
			return _pattern;
		}

		public function set pattern(value:String):void
		{
			_pattern = value;
		}
		
		private var _selectedDate:String;
		public function get selectedDate():String
		{
			return _selectedDate;
		}

		public function set selectedDate(value:String):void
		{
			_selectedDate = value;
		}
		
		private var _minDate:String;
		public function get minDate():String
		{
			return _minDate;
		}

		public function set minDate(value:String):void
		{
			_minDate = value;
		}
		
		private var _maxDate:String;
		public function get maxDate():String
		{
			return _maxDate;
		}

		public function set maxDate(value:String):void
		{
			_maxDate = value;
		}
		
		private var _mode:String;
		public function get mode():String
		{
			return _mode;
		}

		public function set mode(value:String):void
		{
			_mode = value;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void
		{
			setComponentSize(xml);
			
			this.pattern = xml.@pattern ? xml.@pattern : this.pattern;

            this.selectedDate = xml.@selectedDate;
            this.mode = xml.@mode;

            this.minDate = xml.@minDate;
            this.maxDate = xml.@maxDate;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

            xml.@mode = this.mode;
            xml.@pattern = this.pattern;

            if (this.minDate)
            {
                xml.@minDate = this.minDate;
            }

            if (this.maxDate)
            {
                xml.@maxDate = this.maxDate;
            }

            if (this.selectedDate)
            {
                xml.@value = this.selectedDate;
            }

            return xml;
		}
	}
}