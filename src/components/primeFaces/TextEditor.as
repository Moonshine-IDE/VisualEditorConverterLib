package components.primeFaces
{
	import interfaces.ILookup;

	import mx.utils.StringUtil;
	
	import components.ComponentBase;
	
	import interfaces.components.ITextEditor;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class TextEditor extends ComponentBase implements ITextEditor
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "textEditor";
		public static const ELEMENT_NAME:String = "TextEditor";
		
		private var _widgetVar:String;
		public function set widgetVar(value:String):void
		{
			_widgetVar = value;
		}
		public function get widgetVar():String
		{
			return _widgetVar;
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
		
		private var _pendingPlaceHolder:String;
		public function set placeholder(value:String):void
		{
			_pendingPlaceHolder = value;
		}
		public function get placeholder():String
		{
			return _pendingPlaceHolder;
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

		public function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void
		{
			this.setComponentSize(xml);
			
			if ("@text" in xml) 
			{
				this.text = xml.@text;
			}	
			this.widgetVar = xml.@widgetVar;		
			this.placeholder = xml.@placeholder;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@widgetVar = this.widgetVar ? this.widgetVar : "";
			if (this.text)
			{
				xml.@value = this.text;
			}
			
			if (this.placeholder && StringUtil.trim(this.placeholder).length != 0) xml.@placeholder = this.placeholder;
			return xml;
		}
	}
}