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

	import flash.utils.getQualifiedClassName;
	import global.domino.DominoGlobals;

	
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
		public static const PRIMEFACE_ELEMENT_NAME:String = "Grid";

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

		private var _widthtype:String;
		public function get widthtype():String
		{
			return _widthtype;
		}
		public function set widthtype(value:String):void
		{
			_widthtype = value;
		}


		private var _width:Number;
		override public function get width():Number
		{
			return _width;
		}
		override public function set width(value:Number):void
		{
			_width = value;
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
			
			//Alert.show("fromXML xml:"+xml);
			this.setComponentSize(xml);
			var elementsXML:XMLList = xml.elements();
            if (elementsXML.length() > 0)
            {
                var childCount:int = elementsXML.length();
				//Alert.show("childCount:"+childCount);
                for(var row:int = 0; row < childCount; row++)
                {
					//Alert.show("row:"+row);
                    var rowXML:XML = elementsXML[row];
                    var colListXML:XMLList = rowXML.elements();
					//Alert.show("colListXML:"+colListXML);
					var dominoconv:DominoConverter = DominoConverter.getInstance();
                    
				    var tableRow:Object = dominoconv.getNewInstanceOfComponent(GridRow.GRIDROW_NAME);
					//var tableRow:Object = new GridRow();
 					
					tableRow.percentWidth = tableRow.percentHeight = 100;

                    var colCount:int = colListXML.length();
					 //Alert.show("colCount:"+colCount);
                    for (var col:int = 0; col < colCount; col++)
                    {
                        var colXML:XML = colListXML[col];
                        if (colXML.length() > 0)
                        {
                            var tableItem:Object = dominoconv.getNewInstanceOfComponent(GridItem.GRIDITEM_NAME);
						    //var tableItem:GridItem =new GridItem();
     						
							tableItem.percentWidth = tableRow.percentHeight = 100;

                            var divXMLList:XMLList = colXML.elements();
                            var divXML:XML = divXMLList[0];

                           var div:Object = dominoconv.getNewInstanceOfComponent(Div.ELEMENT_NAME);
							//var div:Object =new Div();
							div.percentWidth = div.percentHeight = 100;

                            tableItem.addElement(div);
							
                            tableRow.addElement(tableItem);
						
                            divXML.@percentWidth = 100;
                            divXML.@percentHeight = 100;
							
                            div.fromXML(divXML, childFromXMLCallback);
							
						}
                    }
						
					if(tableRow!=null){
						component["addElement"](tableRow);
						
					}else{
						Alert.show("tableRow 376 is null")
					}
                   
                }
            }
				
        }

        public function toCode():XML
		{

            var xml:XML = new XML("<table/>");

			var widthIn:Number=0
			//Alert.show("width:"+this.width);
			if(this.width&&this.width>0){
				widthIn=(this.width/96) as Number;
				var m:int = Math.pow(10, 4);
    			widthIn=Math.round(widthIn * m) / m;
				
			}

			if(widthIn==0){
				widthIn=2
			}
			xml.@refwidth=widthIn+"in"

			var tableColumnNumElements:int = 0;
			//widthtype='fixedleft' refwidth='2.5000in'
			//add attirive
			if(this.widthtype != null){
				xml.@widthtype=this.widthtype.toString();
			}else{
				xml.@widthtype="fixedleft"
				//xml.@leftmargin="0"
			}
			//setting center
			// if(xml.@widthtype=="fixedcenter"){
			// 	xml.@leftmargin="0"
			// }
			if(this.minrowheight != null){
				xml.@minrowheight=this.minrowheight;
			}
			var tableRowNumElements:int = component["numElements"];
			//get the max column number
			for (var row0:int = 0; row0 < tableRowNumElements; row0++)
            {
				var tableRow1:Object = component["getElementAt"](row0);
				var gridColumnNumElements_cache:int = tableRow1.numElements;
				if(gridColumnNumElements_cache>tableColumnNumElements){
					tableColumnNumElements = gridColumnNumElements_cache;
				}
			}
			//generate column at first
			if(tableColumnNumElements>0){
				for (var cl:int = 0; cl < tableColumnNumElements; cl++)
                {
					var tableColumnXml:XML = new XML("<tablecolumn/>");
						xml.appendChild(tableColumnXml);
				}


			}
		
			for (var row:int = 0; row < tableRowNumElements; row++)
            {
				var rowXML:XML = new XML("<tablerow/>");
				var tableRow:Object = component["getElementAt"](row);
				//for domino talbe we need get the max column .
                var gridColumnNumElements_cache1:int = tableRow.numElements;
				
				//add domino table table cell for each row.
				for (var col:int = 0; col < gridColumnNumElements_cache1; col++)
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
					//Alert.show("divXML:"+div
					//we need handel div align in here,base on the class of div ,we need seting the align with tabcell
					rowCellXML=fixDominoTableAlign(div,rowCellXML)


					rowXML.appendChild(rowCellXML);
				}

				xml.appendChild(rowXML);

			}
		
			

		

            return xml;
        }

		private function fixDominoTableAlign(div:Object,rowCellXML:XML):XML
		{
			var divcssstr:String=div["cssClass"];
			if(divcssstr!=null){
			
				//hpostion="right" valign="center"
				
				var widthtype:String = "fixedright";
				var rightmargin:String="0";
				var leftmargin:String="0";
				var valign:String="";
				if(divcssstr){
					//Alert.show("divcssstr:"+divcssstr);
					
					if(divcssstr.indexOf("flexHorizontalLayoutRight")>=0){
						widthtype="fixedright"
						rowCellXML.@hpostion="right"
					}
					if(divcssstr.indexOf("flexHorizontalLayoutLeft")>=0){
						widthtype="fixedleft"
						
						rowCellXML.@hpostion="left"
					}

					if(divcssstr.indexOf("flexCenter")>=0){
						widthtype="fixedcenter"
						rowCellXML.@hpostion="center"
						
					}

					//Valign -------
					//Valign Horizonta postion--center
					if(divcssstr.indexOf("flexVerticalLayout")>=0 &&divcssstr.indexOf("flexMiddle")>=0 ){
						widthtype="fixedcenter"
						rowCellXML.@hpostion="center"
					
					}
					// Valign Horizonta postion--left
					//flexVerticalLayout flexVerticalLayoutLeft
					if(divcssstr.indexOf("flexVerticalLayout")>=0 &&divcssstr.indexOf("flexVerticalLayoutLeft")>=0 ){
						widthtype="fixedleft"
						rowCellXML.@hpostion="left"
					}
					// Valign Horizonta postion--right
					//flexVerticalLayout flexVerticalLayoutRight 
					if(divcssstr.indexOf("flexVerticalLayout")>=0 &&divcssstr.indexOf("flexVerticalLayoutRight")>=0 ){
						widthtype="fixedright"
						rowCellXML.@hpostion="right"
					}
					//valign:top | center | bottom"
					//flexVerticalLayout flexMiddle flexVerticalLayoutBottom
					if(divcssstr.indexOf("flexVerticalLayoutBottom")>=0){
						rowCellXML.@valign="bottom"
					}
					if(divcssstr.indexOf("flexVerticalLayoutTop")>=0){
						rowCellXML.@valign="top"
					}
					if(divcssstr.indexOf("flexVerticalLayout")>=0 && divcssstr.indexOf("flexCenter")>=0){
						rowCellXML.@valign="center"
					}


					// rowCellXML.@widthtype=widthtype
					// if(widthtype=="fixedleft"){
					// 	rowCellXML.@leftmargin="0";
					// 	delete rowCellXML.@rightmargin;
					// }
					// if(widthtype=="fixedright"){
					// 	rowCellXML.@rightmargin="0"
					// 	delete rowCellXML.@leftmargin;
					// }

					DominoGlobals.PardefId++;

					var pardef:XML;

					if(rowCellXML.@hpostion=="center"){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"center\" dominotype=\"dominotable\"/>");
					}
					if(rowCellXML.@hpostion=="left"){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"left\" dominotype=\"dominotable\"/>");
					}
					if(rowCellXML.@hpostion=="right"){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"right\" dominotype=\"dominotable\"/>");
					}
					if(!pardef){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"left\" dominotype=\"dominotable\"/>");
				
					}

					var par:XML = new XML("<par def=\""+DominoGlobals.PardefId+"\" />");
					

					var elementsXML:XMLList = rowCellXML.elements();
					//Alert.show("rowCellXML:"+rowCellXML.toXMLString());
					var childCount:int = elementsXML.length();
					for(var i:int = 0; i < childCount; i++)
					{
						var childXML:XML = elementsXML[i];

						if(childXML.name()=="par"){
							//Alert.show("paragraph:"+childXML.@paragraph)
							var parelementsXML:XMLList = childXML.elements();
							var parchildCount:int = parelementsXML.length();
							for(var n:int = 0; n < parchildCount; n++)
							{
								var parchildXML:XML = parelementsXML[n];
							
								if(parchildXML.name()=="_moonshineSelected_field"||parchildXML.name()=="field"){
									//Alert.show("parchildXML:"+parchildXML.toXMLString());
									pardef=fixHideWhenwithField(parchildXML,pardef);
								}		
							}
						}

						if(childXML.name()=="par"&& childXML.@paragraph!="true"){
							var parelementsXML:XMLList = childXML.elements();
            				var parchildCount:int = parelementsXML.length();
						
							for(var j:int = 0; j < parchildCount; j++)
							{
								var parchildXML:XML = parelementsXML[j];
								par.appendChild(parchildXML);
								//this.deleteNode(parchildXML);
							}
							

							
						}

						if(childXML.name()=="table"){
							if(childXML.@hpostion=="center"){
								if(_width){
									//we need setting the parent tablecell hpostion
									//rowCellXML.@hpostion="center";
									var centerAlign:Number=0
									var tableWidth:String=childXML.@refwidth
									if(tableWidth){
										tableWidth=tableWidth.replace("in","")
										var tableNumber:Number = Number(tableWidth);
										var diff:Number=this._width-tableNumber;
										if(diff<0){
											diff=0
										}else{
											centerAlign=(diff/2) as Number;
											var m:int = Math.pow(10, 4);
											centerAlign=Math.round(centerAlign * m) / m;
										}
										childXML.@leftmargin=centerAlign+"in"
										childXML.@widthtype="fixedleft"
										childXML.@widthtypecache="fixedcenter"
									}
								}

								
							}
							
						}

						//we need add hidewhen to predef 
						//fixHideWhenwithField
						//Alert.show("field:"+childXML.name());
						if(childXML.name()=="field"){
							
							
						}
					
					}

					
					var par_elementsXML:XMLList = par.elements();
					var par_childCount:int = par_elementsXML.length();
					if(par_childCount>=1){
						rowCellXML.appendChild(pardef);

						rowCellXML.appendChild(par);
					}

					

					//flexVerticalLayoutBottom
					
				}
			}
			return rowCellXML;
		}

		/**
		 * This function will add the hidewhen formula of field to predef tag
		   So that this format will work with dxl of notes client.
		 */

		private function fixHideWhenwithField(fieldXML:XML,predefXML:XML):XML
		{
			if(fieldXML.@hidewhen){
				var code_xml:XML = new XML("<code event=\"hidewhen\" />");
				var formula_xml:XML = new XML("<formula>"+fieldXML.@hidewhen+"</formula>");
				code_xml.appendChild(formula_xml);
				predefXML.appendChild(code_xml);
			}

			return predefXML;
		}

		private function deleteNode(value:XML)
		{

			if(value==null){return;}
			if(value.parent()==null){return;}
			delete value.parent().children()[value.childIndex()]
		}


    }
}