package components.domino
{
	import components.ComponentBase;

	import interfaces.IComponent;
	import interfaces.components.IDominoParagraph;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;


    import mx.controls.Alert;

	import global.domino.DominoGlobals;
	
	public class DominoParagraph extends ComponentBase implements IDominoParagraph
	{
		private static const PRIME_FACES_XML_ELEMENT_NAME:String = "par";
    	public static var ELEMENT_NAME:String = "Par";

		private var _component:IComponent;

		private var _xml:XML;
		
		public function DominoParagraph(component:IComponent = null)
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
				
		private var _cssClass:String = "flexHorizontalLayout flexHorizontalLayoutLeft flexHorizontalLayoutTop";
		public function get cssClass():String
		{
			return _cssClass;
		}
		
		public function set cssClass(value:String):void
		{
			_cssClass = value;	
		}		
		
		// private var _label:String;
		// public function get label():String
		// {
		// 	return _label;
		// }

		// public function set label(value:String):void
		// {
		// 	_label = value;
		// }

		private var parid:int;
		
		private var _wrap:Boolean;
		public function get wrap():Boolean
		{
			return _wrap;
		}		
		
		public function set wrap(value:Boolean):void
		{
			_wrap = value;
		}		
		
		private function get component():IComponent
		{
			return _component ? _component : this;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this._xml = xml;
			
			setComponentSize(xml);
			
			this.wrap = true;
			if (xml.@["class"])
			{
				this._cssClass = xml.@["class"];
			}
	
            var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            for(var i:int = 0; i < childCount; i++)
            {
                var childXML:XML =elementsXML[i];
				//Alert.show("100:"+childXML.@size);
                childFromXMLCallback(component, childXML);
            }
		}
		
		public function toCode():XML
		{
			var parxml:XML=new XML();
			
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + " def=\""+DominoGlobals.PardefDivId+"\"  paragraph=\"true\" />");
			//flexHorizontalLayoutRight flexHorizontalLayoutLeft flexCenter
			
           // CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);

			///TODO: Adjust for Visual Editor
            //xml["@class"] = _cssClass;

            var elementCount:int = component["numElements"];
            for(var i:int = 0; i < elementCount; i++)
            {
                var element:IComponent = component["getElementAt"](i) as IComponent;
                var exml:XML=element.toCode();
				var hidewhen:String=exml.@hidewhen;
				//Alert.show("exml:"+exml.toXMLString());
				if(exml.name()=="par"){
					exml=exml.children()[0]
				}
				if(hidewhen){
					xml.@hidewhen=hidewhen;
				}
				xml.appendChild(exml);
            }
		

            return xml;
		}

		//fix predef format for center

		private function fixPerdef(xml:XML):XML {


			return xml;
		}

	}
}