package components.primeFaces
{
	import interfaces.components.IButton;
	import interfaces.IComponent;
	import components.ComponentBase;
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;

	public class Button extends ComponentBase implements IButton
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "button";
		public static const PRIME_FACES_XML_ELEMENT_NAME_COMMAND_BUTTON:String = "commandButton";
		public static const ELEMENT_NAME:String = "Button";

		private var _enabled:Boolean;
		public function get enabled():Boolean
		{
			return _enabled;
		}

		public function set enabled(value:Boolean):void
		{
			_enabled = value;
		}
		
		private var _isCommandButton:Boolean;
		public function get isCommandButton():Boolean
		{
			return _isCommandButton;
		}

		public function set isCommandButton(value:Boolean):void
		{
			_isCommandButton = value;
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
		
		private var _toolTip:String;
		public function get toolTip():String
		{
			return _toolTip;
		}

		public function set toolTip(value:String):void
		{
			_toolTip = value;
		}
		
		private var _actionListener:String;
		public function get actionListener():String
		{
			return _actionListener;
		}

		public function set actionListener(value:String):void
		{
			_actionListener = value;
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
		
		private var _width:Number;
		public function get width():Number
		{
			return _width;
		}

		public function set width(value:Number):void
		{
			_width = value;
		}
		
		private var _height:Number;
		public function get height():Number
		{
			return _height;
		}

		public function set height(value:Number):void
		{
			_height = value;
		}
		
		private var _percentWidth:Number;
		public function get percentWidth():Number
		{
			return _percentWidth;
		}

		public function set percentWidth(value:Number):void
		{
			_percentWidth = value;
		}
		
		private var _percentHeight:Number;
		public function get percentHeight():Number
		{
			return _percentHeight;
		}

		public function set percentHeight(value:Number):void
		{
			_percentHeight = value;
		}
	
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.enabled = xml.@disabled == "false" ? true : false;
			this.isCommandButton = xml.@isCommandButton == "true" ? true : false;
            this.label = xml.@value;
            this.toolTip = xml.@title;
			this.actionListener = xml.@actionListener;
		}
		
		public function toCode():XML
		{
		    var test:IComponent = this;
			var tagFace:String = isCommandButton ? PRIME_FACES_XML_ELEMENT_NAME_COMMAND_BUTTON : PRIME_FACES_XML_ELEMENT_NAME;
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(test, tagFace) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, test);

			xml.@disabled = !this.enabled;
            xml.@value = this.label;
			xml.@title = this.toolTip;
			if (isCommandButton) xml.@actionListener = this.actionListener;

			return xml;
		}
	}
}