package components.domino
{
	import components.ComponentBase;

	import interfaces.IComponent;
	import interfaces.dominoComponents.IBody;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class Body extends ComponentBase implements IBody
	{
		private static const DOMINO_ELEMENT_NAME:String = "body";
    	public static var ELEMENT_NAME:String = "Body";

		private var _component:IComponent;

		private var _xml:XML;
		
		public function Body(component:IComponent = null)
		{
			super();
			
			this._component = component;
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
				
			
		
		
	
		private function get component():IComponent
		{
			return _component ? _component : this;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this._xml = xml;
			
			setComponentSize(xml);
			
		
	
            var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            for(var i:int = 0; i < childCount; i++)
            {
                var childXML:XML = elementsXML[i];
                childFromXMLCallback(component, childXML);
            }
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);

			

            var elementCount:int = component["numElements"];
            for(var i:int = 0; i < elementCount; i++)
            {
                var element:IComponent = component["getElementAt"](i) as IComponent;
                xml.appendChild(element.toCode());
            }

            return xml;
		}
	}
}