package components.primeFaces
{
    import components.ComponentBase;
    import interfaces.components.IGrid;
    import components.Container;
    import utils.CodeMxmlUtils;
    import utils.CodeXMLUtils;

	public class Grid extends ComponentBase implements IGrid
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "outputPanel";
        public static const ELEMENT_NAME:String = "Grid";
			
		private static const MAX_COLUMN_COUNT:int = 12;

		public function Grid()
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
		
		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			var elementsXML:XMLList = xml.elements();
            if (elementsXML.length() > 0)
            {
                var childCount:int = elementsXML.length();
                for(var row:int = 0; row < childCount; row++)
                {
                    var rowXML:XML = elementsXML[row];
                    var colListXML:XMLList = rowXML.elements();

                    var gridRow:Container = new Container();
 
                    var colCount:int = colListXML.length();
                    for (var col:int = 0; col < colCount; col++)
                    {
                        var colXML:XML = colListXML[col];
                        if (colXML.length() > 0)
                        {
                            var gridItem:Container = new Container();
     
                            var divXMLList:XMLList = colXML.elements();
                            var divXML:XML = divXMLList[0];

                            var div:Div = new Div();
                            div.percentWidth = div.percentHeight = 100;

                            gridItem.addElement(div);
                            gridRow.addElement(gridItem);

                            divXML.@percentWidth = 100;
                            divXML.@percentHeight = 100;

                            div.fromXML(divXML, childFromXMLCallback);
                        }
                    }

                    this.addElement(gridRow);
                }
            }
		}
		
		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

            var gridRowNumElements:int = this.numElements;
            for (var row:int = 0; row < gridRowNumElements; row++)
            {
                var rowXML:XML = new XML("<div />");
                rowXML["@class"] = "ui-g";

                var gridRow:Container = this.getElementAt(row) as Container;
                var gridColumnNumElements:int = gridRow.numElements;
                for (var col:int = 0; col < gridColumnNumElements; col++)
                {
                    var gridCol:Container = gridRow.getElementAt(col) as Container;
                    var div:Div = gridCol.getElementAt(0) as Div;

                    var colXML:XML = new XML("<div />");
                    colXML["@class"] = this.getClassNameBasedOnColumns(gridColumnNumElements);

                    var divXML:XML = removeHeightFromInternalDiv(div.toCode());

                    colXML.appendChild(divXML);

                    rowXML.appendChild(colXML);
                }

                xml.appendChild(rowXML);
            }

            return xml;
		}
		
		private function getClassNameBasedOnColumns(coulumnCountInRow:int):String
        {
            var columnFactor:int = MAX_COLUMN_COUNT / coulumnCountInRow;

            var uigDefault:String = "ui-g-" + columnFactor;
            var uigDesktop:String = "ui-lg-" + columnFactor;

            var uigPhones:String = "ui-sm-" + columnFactor;
            var uigTablets:String = "ui-md-" + columnFactor;
            var uigBigScreens:String = "ui-xl-" + columnFactor;

            return uigDefault + " " + uigDesktop + " " + uigPhones + " " + uigTablets + " " + uigBigScreens;
        }

		private function removeHeightFromInternalDiv(div:XML):XML
        {
            delete div.@height;
            delete div.@percentHeight;
            div.@style = "width:100%;";

            return div;
        }
	}
}