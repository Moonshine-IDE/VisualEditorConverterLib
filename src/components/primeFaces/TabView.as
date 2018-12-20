package components.primeFaces
{
    
	import components.ComponentBase;
	import interfaces.components.ITabView;
	import utils.CodeXMLUtils;
	import utils.CodeMxmlUtils;
	import interfaces.components.IDiv;
	import interfaces.IComponent;

	public class TabView extends ComponentBase implements ITabView
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "tabView";
        public static const ELEMENT_NAME:String = "TabView";
	
		public function TabView()
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
		
		private var _orientation:String;
		public function get orientation():String
		{
			return _orientation;
		}

		public function set orientation(value:String):void
		{
			_orientation = value;
		}
		
		private var _scrollable:Boolean;
		public function get scrollable():Boolean
		{
			return _scrollable;
		}

		public function set scrollable(value:Boolean):void
		{
			_scrollable = value;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			
			if ("@orientation" in xml)
            {
                this.orientation = xml.@orientation == "" ? "top" : xml.@orientation;
            }
            this.scrollable = xml.@scrollable == "true";

            var tabsXML:XMLList = xml.elements("tab");
            var tabsCount:int = tabsXML.length();
            for(var i:int = 0; i < tabsCount; i++)
            {
                var tabXML:XML = tabsXML[i];
                var tabChildren:XMLList = tabXML.Div;

                var tab:Div = new Div();
                tab.label = tabXML.@title;
                if (tabChildren.length() == 1)
                {
                    super.addElement(tab);
                }
                else
                {
					this.addElement(tab);
                }

                this.tabFromXML(tab, tabXML, childFromXMLCallback);
            }
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

			CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			
			xml.@orientation = this.orientation;
            xml.@scrollable = this.scrollable;

            var tabCount:int = this.numElements;
            for (var i:int = 0; i < tabCount; i++)
            {
                var content:Div = this.getElementAt(i) as Div;
                var contentCount:int = content.numElements;

                var tab:XML = new XML("<tab />");
                tab.addNamespace(primeFacesNamespace);
                tab.setNamespace(primeFacesNamespace);
                tab.@title = content.label;

                for (var j:int = 0; j < contentCount; j++)
                {
                    var component:IComponent = content.getElementAt(j) as IComponent;
                    if (component === null)
                    {
                        continue;
                    }

                    tab.appendChild(component.toCode());
                }

                xml.appendChild(tab);
            }

            return xml;
		}
		
		override public function addElement(element:Object):void
		{
             var internalDiv:Div = new Div();
			 element.addEelement(internalDiv);
		
			 super.addElement(element);	
		}		
		
		private function tabFromXML(tab:Div, xml:XML, callback:Function):void
        {
            var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            var container:Div;
            if (tab.numElements > 0)
            {
                container = tab.getElementAt(0) as Div;
            }
            for(var i:int = 0; i < childCount; i++)
            {
                var childXML:XML = elementsXML[i];
                if (container)
                {
                    callback(container, childXML);
                }
                else
                {
                    container = new Div();
                    container.fromXML(childXML, callback);

                    tab.addElement(container);
                }
            }
        }
	}
}