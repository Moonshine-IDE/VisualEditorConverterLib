package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoRun;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	import interfaces.dominoComponents.IDominoTable

	import components.enum.TableWidthStyle;
	import interfaces.IComponent;

	
	import converter.DominoConverter;
	import converter.Converter;
	import components.primeFaces.Div;
	import spark.components.Alert;
	import components.GridItem;
    import components.GridRow;
	import components.DominoRow;
	import mx.core.IVisualElement;

	
	/** 
	 * Domino table element dxl format 
	 * example:
	 * <table widthtype="fitmargins" cellbordercolor="yellow" 				leftmargin="1in" cellborderstyle="ridge" 						colorstyle="solid" bgcolor="silver" insidewrap="true" 				insidewrapheight="1in"> 
				<border style="solid" width="2px" color="olive" 					dropshadow="true" /> 
				<tablecolumn width="66.58%" /> 
				<tablecolumn width="33.42%" /> 
				<tablerow> 
					<tablecell bgcolor="#e0ffbf"> 
						<pardef id="3" align="center" 									leftmargin="0.0313in" keepwithnext="true" 							keeptogether="true" /> 
						<par def="3"> 
							<picture height="341px" width="218px" 								alttext="caldesigns white two-piece 								dress"> 
								<imageref name="design1.jpg" /> 
								<caption>CALDesigns</caption>
							</picture> 
						</par> 
					</tablecell> 
					<tablecell colorstyle="vgradient" bgcolor="none" 						altbgcolor="#a1e2ff"> 
						<pardef id="4" align="center" 									leftmargin="0.0313in" keepwithnext="true" 							keeptogether="true" /> 
						<par def="4" /> 
						<pardef id="5" leftmargin="0.0313in" 							keepwithnext="true" keeptogether="true" /> 
						<par def="5"> 
							<run> 
								<font size="24pt" color="blue" /> 
								$250 
							</run> 
						</par> 
					</tablecell> 
				</tablerow> 
				<tablerow> 
					<tablecell bgcolor="#ffe1dc"> 
						<pardef id="6" leftmargin="0.0313in" 							keepwithnext="true" keeptogether="true" /> 
						<par def="6"> 
							<imagemap lastdefaultid="8" 									lastcircleid="1" lastrectangleid="55"> 
								<picture height="341px" width="219px" 									alttext="PERDesigns pink two-piece 									sleeveless dress"> 
									<border style="dot" width="1px" 										color="#ff4040" /> 
									<imageref name="design2.jpg" /> 
									<caption>PERDesigns</caption> 
								</picture> 
								<area type="circle" htmlid="bracelet">
									<point x="5" y="82" /> 
									<point x="81" y="158" /> 
									<urllink href="http://www.PERD
									esigns.com/jewelry" /> 
								</area> 
							</imagemap> 
						</par> 
					</tablecell> 
					<tablecell> 
						<cellbackground repeat="hrepeat"> 
							<imageref name="graphic.gif" /> 
						</cellbackground>
						<par def="5" /> 
						<par> 
							<run> 
								<font size="24pt" color="blue" /> 
								$300 
							</run> 
						</par> 
					</tablecell> 
				</tablerow> 
			</table> 
	*/
	public class DominoTable extends ComponentBase implements IDominoTable
	{
        public static const DOMINO_ELEMENT_NAME:String = "table";
        public static const ELEMENT_NAME:String = "table";

		private static const MAX_COLUMN_COUNT:int = 12;

		private var _component:IComponent;
		
        public function DominoTable(component:IComponent = null)
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

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		//--------Domino table attrrite------------------------

		private var _widthtype:TableWidthStyle;
		public function get widthtype():TableWidthStyle
		{
			return _widthtype;
		}
		public function set widthtype(value:TableWidthStyle):void
		{
			_widthtype = value;
		}


		private var _minrowheight:String;
		public function get minrowheight():String
		{
			return _minrowheight;
		}
		public function set minrowheight(value:String):void
		{
			_minrowheight = value;
		}



		private var _rowspacing:String;
		public function get rowspacing():String
		{
			return _rowspacing;
		}
		public function set rowspacing(value:String):void
		{
			_rowspacing = value;
		}

        private var _columnspacing:String;
		public function get columnspacing():String
		{
			return _columnspacing;
		}
		public function set columnspacing(value:String):void
		{
			_columnspacing = value;
		}


        private var _cellborderstyle:String;
		public function get cellborderstyle():String
		{
			return _cellborderstyle;
		}
		public function set cellborderstyle(value:String):void
		{
			_cellborderstyle = value;
		}

        private var _colorstyle:String;
		public function get colorstyle():String
		{
			return _colorstyle;
		}
		public function set colorstyle(value:String):void
		{
			_colorstyle = value;
		}


        private var _bgcolor:String;
		public function get bgcolor():String
		{
			return _bgcolor;
		}
		public function set bgcolor(value:String):void
		{
			_bgcolor = value;
		}

        private var _altbgcolor:String;
		public function get altbgcolor():String
		{
			return _altbgcolor;
		}
		public function set altbgcolor(value:String):void
		{
			_altbgcolor = value;
		}


        private var _leftmargin:String;
		public function get leftmargin():String
		{
			return _leftmargin;
		}
		public function set leftmargin(value:String):void
		{
			_leftmargin = value;
		}

        private var _rightmargin:String;
		public function get rightmargin():String
		{
			return _rightmargin;
		}
		public function set rightmargin(value:String):void
		{
			_rightmargin = value;
		}


        private var _r4spacing:String;
		public function get r4spacing():String
		{
			return _r4spacing;
		}
		public function set r4spacing(value:String):void
		{
			_r4spacing = value;
		}

        private var _rowdisplay:String;
		public function get rowdisplay():String
		{
			return _rowdisplay;
		}
		public function set rowdisplay(value:String):void
		{
			_rowdisplay = value;
		}


        private var _rowtimer:String;
		public function get rowtimer():String
		{
			return _rowtimer;
		}
		public function set rowtimer(value:String):void
		{
			_rowtimer = value;
		}

        private var _sizetabsequally:String;
		public function get sizetabsequally():String
		{
			return _sizetabsequally;
		}
		public function set sizetabsequally(value:String):void
		{
			_sizetabsequally = value;
		}

        private var _tablocation:String;
		public function get tablocation():String
		{
			return _tablocation;
		}
		public function set tablocation(value:String):void
		{
			_tablocation = value;
		}

        private var _outsidewrap:String;
		public function get outsidewrap():String
		{
			return _outsidewrap;
		}
		public function set outsidewrap(value:String):void
		{
			_outsidewrap = value;
		}

        private var _insidewrap:String;
		public function get insidewrap():String
		{
			return _insidewrap;
		}
		public function set insidewrap(value:String):void
		{
			_insidewrap = value;
		}

        private var _insidewrapheight:String;
		public function get insidewrapheight():String
		{
			return _insidewrapheight;
		}
		public function set insidewrapheight(value:String):void
		{
			_insidewrapheight = value;
		}

        public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			var elementsXML:XMLList = xml.elements();
            if (elementsXML.length() > 0)
            {
                var childCount:int = elementsXML.length();
				//Alert.show("childCount:"+childCount);
                for(var row:int = 0; row < childCount; row++)
                {
                    var rowXML:XML = elementsXML[row];
                    var colListXML:XMLList = rowXML.elements();
					//Alert.show("colListXML:"+colListXML);
					var conv:Converter = Converter.getInstance();
                    
				    var tableRow:Object = conv.getNewInstanceOfComponent(GridRow.GRIDROW_NAME);
 					if(tableRow==null){
						 Alert.show("tableRow is null")
					 }
					 tableRow.percentWidth = tableRow.percentHeight = 100;

                    var colCount:int = colListXML.length();
                    for (var col:int = 0; col < colCount; col++)
                    {
                        var colXML:XML = colListXML[col];
                        if (colXML.length() > 0)
                        {
                            var tableItem:Object = conv.getNewInstanceOfComponent(GridItem.GRIDITEM_NAME);
     						
							tableItem.percentWidth = tableRow.percentHeight = 100;

                            var divXMLList:XMLList = colXML.elements();
                            var divXML:XML = divXMLList[0];

                            var div:Object = conv.getNewInstanceOfComponent(Div.ELEMENT_NAME);
						
							div.percentWidth = div.percentHeight = 100;

                            tableItem.addElement(div);
                            tableRow.addElement(tableItem);

                            divXML.@percentWidth = 100;
                            divXML.@percentHeight = 100;

                            div.fromXML(divXML, childFromXMLCallback);
                        }
                    }

                    component["addElement"](tableRow as IVisualElement);
                }
            }
        }

        public function toCode():XML
		{

            var xml:XML = new XML("<table/>");
			//add attirive
			if(this.widthtype != null){
				xml.@widthtype=this.widthtype.toString();
			}
			if(this.minrowheight != null){
				xml.@minrowheight=this.minrowheight;
			}
			var tableRowNumElements:int = component["numElements"];
			
			var tableColumnNumElements:int = 0;
			for (var row:int = 0; row < tableRowNumElements; row++)
            {
				var rowXML:XML = new XML("<tablerow/>");
				var tableRow:Object = component["getElementAt"](row);
				//for domino talbe we need get the max column .
                var gridColumnNumElements_cache:int = tableRow.numElements;
				if(gridColumnNumElements_cache>tableColumnNumElements){
					tableColumnNumElements = gridColumnNumElements_cache;
				}

				//add domino table table cell for each row.
				for (var col:int = 0; col < gridColumnNumElements_cache; col++)
                {
					var tableCol:Object = tableRow["getElementAt"](col);
                    var div:Object = tableCol.getElementAt(0);
					var divNumElements:int = div["numElements"];
					//Alert.show("divNumElements:"+divNumElements);
					var rowCellXML:XML = new XML("<tablecell/>");
					if(divNumElements>0){
							for (var div_count:int = 0; div_count < divNumElements; div_count++){
									var tableCellElement:Object = div["getElementAt"](div_count);
									rowCellXML.appendChild(tableCellElement.toCode());
							}
					}

					//var divXML:XML = tableCol[0];

					//Alert.show("divXML:"+div);
                         

				
				

					rowXML.appendChild(rowCellXML);
				}

				xml.appendChild(rowXML);

			}

			if(tableColumnNumElements>0){
				for (var cl:int = 0; cl < tableColumnNumElements; cl++)
                {
					var tableColumnXml:XML = new XML("<tablecolumn/>");
					
				}


			}

			//xml.appendChild(tableColumnXml);

            return xml;
        }


    }
}