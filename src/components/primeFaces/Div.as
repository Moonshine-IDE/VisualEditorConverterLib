package components.primeFaces
{
	import interfaces.components.IDiv;
	import components.ComponentBase;
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import interfaces.IComponent;
	
	public class Div extends ComponentBase implements IDiv
	{
		private static const PRIME_FACES_XML_ELEMENT_NAME:String = "div";
    	public static var ELEMENT_NAME:String = "Div";

		private var _xml:XML;
		
		public function Div()
		{
			super();
		}
		
		private var _cssClass:String;
		public function get cssClass():String
		{
			return _cssClass;
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
			this._xml = xml;
			
			this._cssClass = xml.@["class"];
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);

			///TODO: Adjust for Visual Editor
            xml["@class"] = _cssClass;

            var elementCount:int = this.numElements;
            for(var i:int = 0; i < elementCount; i++)
            {
                var element:IComponent = this.getElementAt(i) as IComponent;
                xml.appendChild(element.toCode());
            }

            return xml;
		}
	}
}