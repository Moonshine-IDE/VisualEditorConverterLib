package components.primeFaces
{
	import mx.containers.GridItem;
	import mx.containers.GridRow;
	
	import components.ComponentBase;
	
	import interfaces.IComponent;
	import interfaces.IVisualComponent;
	import interfaces.components.IPanelGrid;
	import interfaces.components.ITable;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class PanelGrid extends ComponentBase implements IPanelGrid, ITable
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "panelGrid";
		public static const ELEMENT_NAME:String = "PanelGrid";
		
		private var bodyRowsXML:XMLList;
		private var thisCallbackXML:Function;
		
		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}
		
		private var _cdataXML:XML;
		public function get cdataXML():XML
		{
			return _cdataXML;
		}
		
		private var _cdataInformation:String;
		public function get cdataInformation():String
		{
			return _cdataInformation;
		}
		
		public function get hasHeader():Boolean
		{
			return this.headerRowCount > 0;
		}
		
		protected var _headerRowCount:int = -1;
		public function get headerRowCount():int
		{
			return _headerRowCount;
		}
		public function set headerRowCount(value:int):void
		{
			if (_headerRowCount != value)
			{
				_headerRowCount = value;
			}
		}
		
		protected var _columnCount:int;
		public function get columnCount():int
		{
			return _columnCount;
		}
		public function set columnCount(value:int):void
		{
			if (_columnCount != value)
			{
				_columnCount = value;
			}
		}
		
		private var _headerRowTitles:Array;
		public function get headerRowTitles():Array
		{
			return _headerRowTitles;
		}
		public function set headerRowTitles(value:Array):void
		{
			_headerRowTitles = value;
		}
		
		protected var _rowCount:int;
		public function get rowCount():int
		{
			return _rowCount;
		}
		
		public function set rowCount(value:int):void
		{
			if (_rowCount != value)
			{
				_rowCount = value;
			}
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			
			_cdataXML = CodeXMLUtils.getCdataXML(xml);
			_cdataInformation = CodeXMLUtils.getCdataInformationFromXML(xml);
			
			this.bodyRowsXML = xml.Row;
			var header:XMLList = xml.Header.Row;
			var rCount:int = 0;
			
			if ("@headerRowCount" in xml)
			{
				this.headerRowCount = xml.@headerRowCount;
			}
			else
			{
				rCount = header.length();
				if (rCount > 0)
				{
					this.headerRowCount = rCount;
				}
				else
				{
					this.headerRowCount = -1;
				}
			}
			
			if (this.hasHeader)
			{
				this.headerRowTitles = [];
				for (var headerIndex:int = 0; headerIndex < this.headerRowCount; headerIndex++)
				{
					var tmpArr:Array = [];
					for each (var headerTitle:XML in header[headerIndex].Column)
					{
						tmpArr.push(headerTitle.toString());
					}
					
					headerRowTitles.push(tmpArr);
				}
			}
			
			if ("@rowCount" in xml)
			{
				this.rowCount = xml.@rowCount;
			}
			else
			{
				rCount = bodyRowsXML.length();
				if (rCount > 0)
				{
					this.rowCount = rCount;
				}
				else
				{
					this.rowCount = 1;
				}
			}
			
			if ("@columnCount" in xml)
			{
				this.columnCount = xml.@columnCount;
			}
			else
			{
				var columns:XMLList = bodyRowsXML[0].Column;
				var colCount:int = columns.length();
				if (colCount > 0)
				{
					this.columnCount = colCount;
				}
				else
				{
					this.columnCount = 1;
				}
			}
			
			thisCallbackXML = childFromXMLCallback;
			
			// @note
			// When to call this method? createChildren()?
			createChildrenFromXML();
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			toCodeHeader(xml);
			toCodeBody(xml);

			return xml;
		}
		
		private function createChildrenFromXML():void
		{
			if (!bodyRowsXML && thisCallbackXML == null) return;
			
			for (var rowIndex:int; rowIndex < rowCount; rowIndex++)
			{
				var rowXML:XML = bodyRowsXML[rowIndex];
				var item:IComponent = new Div();
				var div:XML = rowXML[0];
				item.fromXML(div, thisCallbackXML);
				this.addElement(item);
			}
		}
		
		private function toCodeHeader(xml:XML):void
		{
			if (!this.hasHeader) return;
			
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			var facetNamespace:Namespace = new Namespace("f", "http://xmlns.jcp.org/jsf/core");
			var facet:XML = new XML("<facet/>");
			facet.addNamespace(facetNamespace);
			facet.setNamespace(facetNamespace);
			
			facet.@name = "header";
			
			for (var row:int = 0; row < this.headerRowCount; row++)
			{
				var rowXML:XML = new XML("<row/>");
				rowXML.addNamespace(primeFacesNamespace);
				rowXML.setNamespace(primeFacesNamespace);
				for (var col:int = 0; col < this.columnCount; col++)
				{
					var headerTitle:String = (this.hasOwnProperty("header")) ? this["header"].getTitle(row, col) : getTitleFromXML(row, col);
					var colXML:XML = new XML("<column>" + headerTitle + "</column>");
					colXML.addNamespace(primeFacesNamespace);
					colXML.setNamespace(primeFacesNamespace);
					
					rowXML.appendChild(colXML);
				}
				
				facet.appendChild(rowXML);
			}
			
			xml.appendChild(facet);
		}
		
		private function toCodeBody(xml:XML):void
		{
			// in case of CLI run
			if (!this.hasOwnProperty("body"))
			{
				generateCodeByXML(xml);
				return;
			}
			
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			
			var bodyRowCount:int = this["body"].numElements;
			for (var row:int = 0; row < bodyRowCount; row++)
			{
				var gridRow:GridRow = this["body"].getElementAt(row) as GridRow;
				var rowXML:XML = new XML("<row/>");
				rowXML.addNamespace(primeFacesNamespace);
				rowXML.setNamespace(primeFacesNamespace);
				for (var col:int = 0; col < this.columnCount; col++)
				{
					var gridItem:GridItem = gridRow.getElementAt(col) as GridItem;
					var divContent:Div = gridItem.getElementAt(0) as Div;
					
					var colXML:XML = new XML("<column></column>");
					colXML.addNamespace(primeFacesNamespace);
					colXML.setNamespace(primeFacesNamespace);
					
					colXML.appendChild(divContent.toCode());
					
					rowXML.appendChild(colXML);
				}
				
				xml.appendChild(rowXML);
			}
		}
		
		private function getTitleFromXML(selectedRowIndex:int = -1, selectedColumnIndex:int = -1):String
		{
			return headerRowTitles[selectedRowIndex][selectedColumnIndex];
		}
		
		private function generateCodeByXML(xml:XML):void
		{
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			
			for (var row:int=0; row < numElements; row++)
			{
				var rowXML:XML = new XML("<row/>");
				rowXML.addNamespace(primeFacesNamespace);
				rowXML.setNamespace(primeFacesNamespace);
				
				var rowElement:IVisualComponent = this.getElementAt(row) as IVisualComponent;
				for (var col:int=0; col < rowElement.numElements; col++)
				{
					var colXML:XML = new XML("<column></column>");
					colXML.addNamespace(primeFacesNamespace);
					colXML.setNamespace(primeFacesNamespace);
					
					var colElement:IComponent = rowElement.getElementAt(col) as IComponent;
					colXML.appendChild(colElement.toCode());
					rowXML.appendChild(colXML);
				}
				
				xml.appendChild(rowXML);
			}
		}
	}
}