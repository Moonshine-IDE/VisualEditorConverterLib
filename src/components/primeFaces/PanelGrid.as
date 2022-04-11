package components.primeFaces
{
	import components.ComponentBase;
	import components.GridItem;
	import components.GridRow;
	import components.common.Div;

	import converter.PrimeFacesConverter;

	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.components.IDiv;
	import interfaces.components.IPanelGrid;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class PanelGrid extends ComponentBase implements IPanelGrid
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "panelGrid";
		public static const ELEMENT_NAME:String = "PanelGrid";
		
		private var _component:IComponent;

		public function PanelGrid(component:IComponent = null):void
		{
			super();
			
			_component = component;
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

		private var _callbackXML:Function;

		public function get callbackXML():Function
		{
			return _callbackXML;
		}
		
		private var _bodyRowsXML:XMLList;

		public function get bodyRowsXML():XMLList
		{
			return _bodyRowsXML;
		}
		
		private function get component():IComponent
		{
			return _component;
		}
		
		
		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void
		{
			this.setComponentSize(xml);

			_bodyRowsXML = xml.Row;
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
			
			_callbackXML = childFromXMLCallback;
			
			if (component == null)
			{
				createBodyChildren(lookup);
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

			toCodeHeader(xml);
			toCodeBody(xml);

			return xml;
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
					var headerTitle:String = component ? component["header"]["getTitle"](row, col) : this.getTitle(row, col);
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
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			
			var elementsCount:int = component ? component["body"]["numElements"] : this.numElements;
			for (var row:int=0; row < elementsCount; row++)
			{
				var rowXML:XML = new XML("<row/>");
				rowXML.addNamespace(primeFacesNamespace);
				rowXML.setNamespace(primeFacesNamespace);
				
				var body:Object = component ? component["body"] : this;
				var rowElement:Object = body.getElementAt(row);
				for (var col:int=0; col < rowElement.numElements; col++)
				{
					var colXML:XML = new XML("<column></column>");
					colXML.addNamespace(primeFacesNamespace);
					colXML.setNamespace(primeFacesNamespace);
					
					var colElement:IComponent = rowElement.getElementAt(col) as IComponent;					
					var div:IComponent = colElement["getElementAt"](0);
					
					colXML.appendChild(div.toCode());
					rowXML.appendChild(colXML);
				}
				
				xml.appendChild(rowXML);
			}
		}
		
		public function getTitle(selectedRowIndex:int = -1, selectedColumnIndex:int = -1):String
		{
			return headerRowTitles[selectedRowIndex][selectedColumnIndex];
		}
			
		private function createBodyChildren(lookup:ILookup = null):void
		{
			if (!bodyRowsXML && callbackXML == null) return;
			
			for (var rowIndex:int; rowIndex < rowCount; rowIndex++)
			{
				var rowXML:XML = bodyRowsXML[rowIndex];
				var columnsXML:XMLList = bodyRowsXML[rowIndex].Column;
				var container:Object = PrimeFacesConverter.getNewInstanceOfComponent(lookup, GridRow.GRIDROW_NAME);
				
				for (var colIndex:int = 0; colIndex < this.columnCount; colIndex++)
                {
                    var colXML:XML = columnsXML[colIndex];
                    var divs:XMLList = colXML.Div;
	
					var item:IComponent = PrimeFacesConverter.getNewInstanceOfComponent(lookup, GridItem.GRIDITEM_NAME);
					var div:IDiv = PrimeFacesConverter.getNewInstanceOfComponent(lookup, Div.ELEMENT_NAME) as IDiv;
					
					if (divs.length() > 0)
                    {
						var divXMLList:XMLList = divs.children();
                        //Make transition only if div contains children, if not it does not needed.
                        if (divXMLList.length() > 0)
                        {
                            var divXML:XML = divs[0];
                            if ("@percentHeight" in divXML)
                            {
                                delete divXML.@percentHeight;
                            }
							
                            div.fromXML(divXML, callbackXML);
                        }
					}
					else
					{
						for each (var columnContent:XML in colXML)
                        {
                            if (columnContent)
                            {
                                callbackXML(item, columnContent);
                            }
                        }
					}
					
					item["addElement"](div);
					container.addElement(item);
				}
				
				this.addElement(container);
			}
		}
	}
}