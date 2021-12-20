package components.primeFaces
{
	import mx.utils.StringUtil;
	
	import components.ComponentBase;
	
	import interfaces.components.IInputTextarea;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class InputTextarea extends ComponentBase implements IInputTextarea
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "inputTextarea";
		public static const ELEMENT_NAME:String = "InputTextarea";
		
		private static const DEFAULT_COUNTER_TEMPLATE:String = "{0} characters remaining.";
		
		private var _text:String;
		public function set text(value:String):void
		{
			_text = value;
		}
		public function get text():String
		{
			return _text;
		}	
		
		private var _isAutoResize:Boolean;
		public function get isAutoResize():Boolean
		{
			return _isAutoResize;
		}
		public function set isAutoResize(value:Boolean):void
		{
			_isAutoResize = value;
		}
		
		private var _maxLength:String = "";
		public function get maxLength():String
		{
			return _maxLength;
		}
		public function set maxLength(value:String):void
		{
			_maxLength = value;
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
		
		private var _isCounterDisplay:Boolean;
		public function get isCounterDisplay():Boolean
		{
			return _isCounterDisplay;
		}
		public function set isCounterDisplay(value:Boolean):void
		{
			_isCounterDisplay = value;
		}
		
		private var _counterTemplate:String = DEFAULT_COUNTER_TEMPLATE;
		public function get counterTemplate():String
		{
			return _counterTemplate;
		}
		public function set counterTemplate(value:String):void
		{
			_counterTemplate = value;
		}
		
		private var _counter:String;
		public function get counter():String
		{
			return _counter;
		}
		public function set counter(value:String):void
		{
			_counter = value;
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
			
			this.text = xml.@value;
			this.isAutoResize = xml.@isAutoResize == "true";
			this.maxLength = xml.@maxlength;
			this.required = xml.@required == "true";
			
			if (String(xml.@isCounterDisplay) == "true")
			{
				this.isCounterDisplay = true;
				this.counterTemplate = String(xml.@counterTemplate);
				if (xml.@counter != undefined) this.counter = String(xml.@counter);
			}
			
			this.idAttribute = xml.@id;
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
			xml.@autoResize = this.isAutoResize;
			xml.@required = this.required;
			
			if ((StringUtil.trim(maxLength).length != 0) && Math.round(Number(maxLength)) != 0)
			{
				xml.@maxlength = this.maxLength;
			}
			if (isCounterDisplay)
			{
				xml.@counterTemplate = this.counterTemplate;
				if (StringUtil.trim(counter).length != 0) xml.@counter = this.counter;
			}
			
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