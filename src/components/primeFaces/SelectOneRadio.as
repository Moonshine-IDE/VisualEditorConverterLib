package components.primeFaces
{
    import components.ComponentBase;
    import interfaces.components.ISelectOneRadio;
    import vo.SelectItem;
    import utils.CodeXMLUtils;
    import interfaces.IComponent;
    import utils.CodeMxmlUtils;

	public class SelectOneRadio extends ComponentBase implements ISelectOneRadio
	{
	    public static const PRIME_FACES_XML_ELEMENT_NAME:String = "selectOneRadio";
        public static const ELEMENT_NAME:String = "SelectOneRadio";

		private var items:Array;
		
		public function SelectOneRadio()
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
		
		private var _value:String;
		public function get value():String
		{
			return _value;
		}

		public function set value(value:String):void
		{
			_value = value;
		}
		
		private var _columns:int;
		public function get columns():int
		{
			return _columns;
		}

		public function set columns(value:int):void
		{
			_columns = value;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			this.columns = (xml.@columns != undefined) ? int(xml.@columns) : 0;
			this.value = xml.@value;
			
			var tmpItem:SelectItem;
			items = [];
			
			for each (var i:XML in xml.selectItem)
			{
				tmpItem = new SelectItem();
				tmpItem.itemLabel = i.@itemLabel;
				tmpItem.itemValue = i.@itemValue;
				items.push(tmpItem);
			}
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var facetNamespace:Namespace = new Namespace("f", "http://xmlns.jcp.org/jsf/core");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);
			
			if (this.value)
			{
            		xml["@value"] = this.value;
			}
			
			if (columns > 0)
			{
				xml["@layout"] = "grid";
				xml["@columns"] = columns;
			}
			
			var itemXML:XML;
			for each (var item:SelectItem in items)
			{
				itemXML = new XML("<selectItem />");
				itemXML.addNamespace(facetNamespace);
				itemXML.setNamespace(facetNamespace);
				itemXML["@itemLabel"] = item.itemLabel;
				itemXML["@itemValue"] = item.itemValue ? item.itemValue : "";
				xml.appendChild(itemXML);
			}

            return xml;
		}
	}
}