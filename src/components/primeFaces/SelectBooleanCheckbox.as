package components.primeFaces
{
	import components.ComponentBase;
	import interfaces.components.ISelectBooleanCheckbox;
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;

	public class SelectBooleanCheckbox extends ComponentBase implements ISelectBooleanCheckbox
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "selectBooleanCheckbox";
		public static const ELEMENT_NAME:String = "CheckBox";
		
		public function SelectBooleanCheckbox()
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
		
		private var _label:String;
		public function get label():String
		{
			return _label;
		}
		public function set label(value:String):void
		{
			_label = value;
		}
		
		private var _selected:Boolean;
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			this.label = xml.@label;
            this.selected = xml.@selected == "true" ? true : false;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@value = this.selected;
			if (this.label) 
			{
				xml.@itemLabel = this.label;
			}

			return xml;
		}
	}
}