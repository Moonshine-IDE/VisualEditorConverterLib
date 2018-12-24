package components.primeFaces
{
	import mx.collections.ArrayCollection;
	
	import components.ComponentBase;
	
	import interfaces.components.IDataTable;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	import vo.DataProviderListItem;
	
	public class DataTable extends ComponentBase implements IDataTable
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "dataTable";
		public static const ELEMENT_NAME:String = "DataTable";
		
		private static const NO_RECORDS_FOUND:String = "No records found.";
		
		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}
		
		private var _paginator:Boolean;
		public function get paginator():Boolean
		{
			return _paginator;
		}
		public function set paginator(value:Boolean):void
		{
			_paginator = value;
		}
		
		private var _resizableColumns:Boolean;
		public function get resizableColumns():Boolean
		{
			return _resizableColumns;
		}
		public function set resizableColumns(value:Boolean):void
		{
			_resizableColumns = value;
		}
		
		private var _emptyMessage:String = NO_RECORDS_FOUND;
		public function get emptyMessage():String
		{
			return _emptyMessage;
		}
		public function set emptyMessage(value:String):void
		{
			_emptyMessage = value;
		}
		
		private var _tableVar:String = "";
		public function get tableVar():String
		{
			return _tableVar;
		}
		public function set tableVar(value:String):void
		{
			_tableVar = value;
		}
		
		private var _tableValue:String = "";
		public function get tableValue():String
		{
			return _tableValue;
		}
		public function set tableValue(value:String):void
		{
			_tableValue = value;
		}
		
		private var _tableColumnDescriptor:ArrayCollection;
		public function get tableColumnDescriptor():ArrayCollection
		{
			return _tableColumnDescriptor;
		}
		public function set tableColumnDescriptor(value:ArrayCollection):void
		{
			_tableColumnDescriptor = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			this.paginator = xml.@paginator == "true";
			this.resizableColumns = xml.@resizableColumns == "true";
			this.emptyMessage = !xml.@emptyMessage ? NO_RECORDS_FOUND : xml.@emptyMessage;
			this.tableVar = xml.@['var'];
			this.tableValue = xml.@value;
			
			_tableColumnDescriptor = new ArrayCollection();
			
			// re-generate column
			for each (var col:XML in xml.column)
			{
				var tmpColumnVO:DataProviderListItem = new DataProviderListItem();
				tmpColumnVO.label = col.@headerText;
				tmpColumnVO.value = col.@value;
				_tableColumnDescriptor.addItem(tmpColumnVO);
			}
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			var hNamespace:Namespace = new Namespace("h", "http://xmlns.jcp.org/jsf/html");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@paginator = this.paginator;
			xml.@resizableColumns = this.resizableColumns;
			xml.@emptyMessage = this.emptyMessage;
			if (tableVar != "") xml.@['var'] = tableVar;
			if (tableValue != "") xml.@value = tableValue;
			
			var column:XML;
			var outputText:XML;
			for each (var col:DataProviderListItem in tableColumnDescriptor)
			{
				column = new XML("<column/>");
				column.addNamespace(primeFacesNamespace);
				column.setNamespace(primeFacesNamespace);
				column.@headerText = col.label;
				
				if (tableVar != "")
				{
					outputText = new XML("<outputText/>");
					outputText.addNamespace(hNamespace);
					outputText.setNamespace(hNamespace);
					outputText.@value = "#{"+ tableVar +"."+ (col.value ||= '') +"}";
					column.appendChild(outputText);
				}
				
				xml.appendChild(column);
			}

			return xml;
		}
	}
}