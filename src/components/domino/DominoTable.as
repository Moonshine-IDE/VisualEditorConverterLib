////////////////////////////////////////////////////////////////////////////////
// Copyright 2022 Prominic.NET, Inc.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and 
// limitations under the License
// 
// Author: Prominic.NET, Inc.
// No warranty of merchantability or fitness of any kind. 
// Use this software at your own risk.
////////////////////////////////////////////////////////////////////////////////
package components.domino
{
	import components.ComponentBase;
	import components.GridItem;
	import components.GridRow;
	import components.common.Div;
	import components.DominoConponentHideBase;

	import converter.DominoConverter;

	import global.domino.DominoGlobals;

	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoTable;

	import spark.components.Alert;
	import global.domino.DominoGlobals;


	/**
	 *  <p>Representation and converter from  Visuale table  components  </p>
	 * 
	 *  <p>This class work for  convert from Visuale table  components  to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoTable</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *   &lt;table widthtype=&quot;fitmargins&quot; cellbordercolor=&quot;yellow&quot; 				leftmargin=&quot;1in&quot; cellborderstyle=&quot;ridge&quot; 						colorstyle=&quot;solid&quot; bgcolor=&quot;silver&quot; insidewrap=&quot;true&quot; 				insidewrapheight=&quot;1in&quot;&gt;
	 *			&lt;border style=&quot;solid&quot; width=&quot;2px&quot; color=&quot;olive&quot; 					dropshadow=&quot;true&quot; /&gt;
	 *			&lt;tablecolumn width=&quot;66.58%&quot; /&gt;
	 *			&lt;tablecolumn width=&quot;33.42%&quot; /&gt;
	 *			&lt;tablerow&gt;
	 *				&lt;tablecell bgcolor=&quot;#e0ffbf&quot;&gt;
	 *					&lt;pardef id=&quot;3&quot; align=&quot;center&quot; 									leftmargin=&quot;0.0313in&quot; keepwithnext=&quot;true&quot; 							keeptogether=&quot;true&quot; /&gt;
	 *					&lt;par def=&quot;3&quot;&gt;
	 *						&lt;picture height=&quot;341px&quot; width=&quot;218px&quot; 								alttext=&quot;caldesigns white two-piece 								dress&quot;&gt;
	 *							&lt;imageref name=&quot;design1.jpg&quot; /&gt;
	 *							&lt;caption&gt;CALDesigns&lt;/caption&gt;
	 *						&lt;/picture&gt;
	 *					&lt;/par&gt;
	 *				&lt;/tablecell&gt;
	 *				&lt;tablecell colorstyle=&quot;vgradient&quot; bgcolor=&quot;none&quot; 						altbgcolor=&quot;#a1e2ff&quot;&gt;
	 *					&lt;pardef id=&quot;4&quot; align=&quot;center&quot; 									leftmargin=&quot;0.0313in&quot; keepwithnext=&quot;true&quot; 							keeptogether=&quot;true&quot; /&gt;
	 *					&lt;par def=&quot;4&quot; /&gt;
	 *					&lt;pardef id=&quot;5&quot; leftmargin=&quot;0.0313in&quot; 							keepwithnext=&quot;true&quot; keeptogether=&quot;true&quot; /&gt;
	 *					&lt;par def=&quot;5&quot;&gt;
	 *						&lt;run&gt;
	 *							&lt;font size=&quot;24pt&quot; color=&quot;blue&quot; /&gt;
	 *							$250
	 *						&lt;/run&gt;
	 *					&lt;/par&gt;
	 *				&lt;/tablecell&gt;
	 *			&lt;/tablerow&gt;
	 *			&lt;tablerow&gt;
	 *				&lt;tablecell bgcolor=&quot;#ffe1dc&quot;&gt;
	 *					&lt;pardef id=&quot;6&quot; leftmargin=&quot;0.0313in&quot; 							keepwithnext=&quot;true&quot; keeptogether=&quot;true&quot; /&gt;
	 *					&lt;par def=&quot;6&quot;&gt;
	 *						&lt;imagemap lastdefaultid=&quot;8&quot; 									lastcircleid=&quot;1&quot; lastrectangleid=&quot;55&quot;&gt;
	 *							&lt;picture height=&quot;341px&quot; width=&quot;219px&quot; 									alttext=&quot;PERDesigns pink two-piece 									sleeveless dress&quot;&gt;
	 *								&lt;border style=&quot;dot&quot; width=&quot;1px&quot; 										color=&quot;#ff4040&quot; /&gt;
	 *								&lt;imageref name=&quot;design2.jpg&quot; /&gt;
	 *								&lt;caption&gt;PERDesigns&lt;/caption&gt;
	 *							&lt;/picture&gt;
	 *							&lt;area type=&quot;circle&quot; htmlid=&quot;bracelet&quot;&gt;
	 *								&lt;point x=&quot;5&quot; y=&quot;82&quot; /&gt;
	 *								&lt;point x=&quot;81&quot; y=&quot;158&quot; /&gt;
	 *								&lt;urllink href=&quot;http://www.PERD
	 *								esigns.com/jewelry&quot; /&gt;
	 *							&lt;/area&gt;
	 *						&lt;/imagemap&gt;
	 *					&lt;/par&gt;
	 *				&lt;/tablecell&gt;
	 *				&lt;tablecell&gt;
	 *					&lt;cellbackground repeat=&quot;hrepeat&quot;&gt;
	 *						&lt;imageref name=&quot;graphic.gif&quot; /&gt;
	 *					&lt;/cellbackground&gt;
	 *					&lt;par def=&quot;5&quot; /&gt;
	 *					&lt;par&gt;
	 *						&lt;run&gt;
	 *							&lt;font size=&quot;24pt&quot; color=&quot;blue&quot; /&gt;
	 *							$300
	 *						&lt;/run&gt;
	 *					&lt;/par&gt;
	 *				&lt;/tablecell&gt;
	 *			&lt;/tablerow&gt;
	 *		&lt;/table&gt;
	 * </pre> 
	 *
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_TABLE_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoTable.as
	 */

	public class DominoTable extends DominoConponentHideBase implements IDominoTable, IRoyaleComponentConverter
	{
		public static const ROYALE_XML_ELEMENT:String = "SimpleTable";
		public static const ELEMENT_NAME:String = "table";

		public function DominoTable(component:IComponent = null)
		{
			super();

			_component = component;
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

		private var _isSelected:Boolean;

		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		//--------Domino table attrrite------------------------

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		private var _widthtype:String;

		public function get widthtype():String
		{
			return _widthtype;
		}

		public function set widthtype(value:String):void
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

		private var _refwidth:String;

		public function get refwidth():String
		{
			return _refwidth;
		}

		public function set refwidth(value:String):void
		{
			_refwidth = value;
		}

		private var _columnProperties:String;

		public function get columnProperties():String
		{
			return _columnProperties;
		}

		public function set columnProperties(value:String):void
		{
			_columnProperties = value;
		}

		private var _component:IComponent;

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			var localSurface:ISurface = surface;

			this.setComponentSize(xml);
			var elementsXML:XMLList = xml.elements();
			this.refwidth = xml.@refwidth;
			this.columnProperties = xml.@columsProperty;
		
			if (xml.@leftmargin)
			{
				this.leftmargin = xml.@leftmargin;
			}

			if (elementsXML.length() > 0)
			{
			
				var childCount:int = elementsXML.length();
				for (var row:int = 0; row < childCount; row++)
				{
					var rowXML:XML = elementsXML[row];
					
					var colListXML:XMLList = rowXML.elements();

					var tableRow:Object = DominoConverter.getNewInstanceOfComponent(lookup, GridRow.GRIDROW_NAME);
		
					tableRow.percentWidth = tableRow.percentHeight = 100;

					var colCount:int = colListXML.length();
					for (var col:int = 0; col < colCount; col++)
					{
						var colXML:XML = colListXML[col];
						if (colXML.length() > 0)
						{
							var tableItem:Object = DominoConverter.getNewInstanceOfComponent(lookup, GridItem.GRIDITEM_NAME);

							tableItem.percentWidth = tableRow.percentHeight = 100;

							var divXMLList:XMLList = colXML.elements();
							var divXML:XML = divXMLList[0];

							var div:Object = DominoConverter.getNewInstanceOfComponent(lookup, Div.ELEMENT_NAME);
							div.percentWidth = div.percentHeight = 100;

							tableItem.addElement(div);

							tableRow.addElement(tableItem);

							divXML.@percentWidth = 100;
							divXML.@percentHeight = 100;

							div.fromXML(divXML, childFromXMLCallback, localSurface, lookup);
						}
					}

					if (tableRow != null)
					{
						component["addElement"](tableRow);

					}
				}
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<table/>");
			var par_xml:XML;
			if(this.hide){
				par_xml = new XML("<par dominotype=\"dominoTable\" def=\""+DominoGlobals.PardefDivId+"\"/>");
			}

			var widthIn:Number = 0

			var columnArrTemp:Array = null;
			if (this.columnProperties != null && this.columnProperties.length > 0)
			{
				columnArrTemp = this.columnProperties.split(",");
			}

			if (this.width && this.width > 0)
			{
				widthIn = (this.width / 96) as Number;
				var m:int = Math.pow(10, 4);
				widthIn = Math.round(widthIn * m) / m;
				xml.@refwidth = widthIn + "in";

			}

			if (widthIn == 0)
			{
				widthIn = 2
			}

			if (this.leftmargin)
			{
				xml.@leftmargin = this.leftmargin;
			}

			if(this.hide){
				xml.@hide = this.hide;
			}

			var tableColumnNumElements:int = 0;
			//widthtype='fixedleft' refwidth='2.5000in'
			//add attirive
			if (this.widthtype != null)
			{
				xml.@widthtype = this.widthtype.toString();
			} else
			{
				xml.@widthtype = "fixedleft"
				//xml.@leftmargin="0"
			}

			if (this.minrowheight != null)
			{
				xml.@minrowheight = this.minrowheight;
			}
			var tableRowNumElements:int = component["numElements"];
			//get the max column number
			for (var row0:int = 0; row0 < tableRowNumElements; row0++)
			{
				var tableRow1:Object = component["getElementAt"](row0);
				var gridColumnNumElements_cache:int = tableRow1.numElements;
				if (gridColumnNumElements_cache > tableColumnNumElements)
				{
					tableColumnNumElements = gridColumnNumElements_cache;
				}
			}
			//generate column at first
			if (tableColumnNumElements > 0)
			{
				for (var cl:int = 0; cl < tableColumnNumElements; cl++)
				{
					var tableColumnXml:XML = new XML("<tablecolumn/>");
					if (columnArrTemp != null && columnArrTemp.length >= cl && columnArrTemp.length > 0)
					{
						if (columnArrTemp[cl] != null && columnArrTemp[cl].length > 0)
						{
							tableColumnXml.@width = columnArrTemp[cl];
						}

					}
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

					var rowCellXML:XML = new XML("<tablecell/>");

					if (divNumElements > 0)
					{
						for (var div_count:int = 0; div_count < divNumElements; div_count++)
						{
							var tableCellElement:Object = div["getElementAt"](div_count);
							//we should check the empty par tag in here
							var cellChildXml:XML = tableCellElement.toCode();
							rowCellXML.appendChild(cellChildXml);
						}
					}

					//var divXML:XML = tableCol[0];

					//we need handel div align in here,base on the class of div ,we need seting the align with tabcell

					rowCellXML = fixDominoTableAlign(div, rowCellXML)
					rowXML.appendChild(rowCellXML);
				}

				xml.appendChild(rowXML);
			}

			if(this.hide){
				par_xml.appendChild(xml);
			}

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var jewelNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");

			var tableRootXML:XML = new XML("<" +ROYALE_XML_ELEMENT+ "/>");
				tableRootXML.setNamespace(jewelNamespace);

			var tBodyXML:XML = new XML("<TBody/>");
				tBodyXML.setNamespace(jewelNamespace);

			tableRootXML.appendChild(tBodyXML);

			var rowCount:int = component["numElements"];

			for (var i:int = 0; i < rowCount; i++)
			{
				var tableRow:IComponent = component["getElementAt"](i);
				var cellCount:int = tableRow["numElements"];

				var tableRowXML:XML = new XML("<TableRow/>");
					tableRowXML.setNamespace(jewelNamespace);

				for (var j:int = 0; j < cellCount; j++)
				{
					var tableCell:IComponent = tableRow["getElementAt"](j);
					var tableCellContainer:IRoyaleComponentConverter = tableCell["getElementAt"](0);

					var tableCellXML:XML = new XML("<TableCell/>");
						tableCellXML.setNamespace(jewelNamespace);

					var tableCellContent:XML = tableCellContainer.toRoyaleConvertCode();
					tableCellXML.appendChild(tableCellContent);

					tableRowXML.appendChild(tableCellXML);
				}

				tBodyXML.appendChild(tableRowXML);
			}

			return tableRootXML;
		}

		private function fixDominoTableAlign(div:Object, rowCellXML:XML):XML
		{
			var divcssstr:String = div["cssClass"];
			if (divcssstr != null)
			{
				//hpostion="right" valign="center"
				var widthtype:String = "fixedright";
				var rightmargin:String = "0";
				var leftmargin:String = "0";
				var valign:String = "";
				if (divcssstr)
				{
					if (divcssstr.indexOf("flexHorizontalLayoutRight") >= 0)
					{
						widthtype = "fixedright"
						rowCellXML.@hpostion = "right"
					}
					if (divcssstr.indexOf("flexHorizontalLayoutLeft") >= 0)
					{
						widthtype = "fixedleft"

						rowCellXML.@hpostion = "left"
					}

					if (divcssstr.indexOf("flexCenter") >= 0)
					{
						widthtype = "fixedcenter"
						rowCellXML.@hpostion = "center"
					}

					//Valign -------
					//Valign Horizonta postion--center
					if (divcssstr.indexOf("flexVerticalLayout") >= 0 && divcssstr.indexOf("flexMiddle") >= 0)
					{
						widthtype = "fixedcenter"
						rowCellXML.@hpostion = "center"

					}
					// Valign Horizonta postion--left
					//flexVerticalLayout flexVerticalLayoutLeft
					if (divcssstr.indexOf("flexVerticalLayout") >= 0 && divcssstr.indexOf("flexVerticalLayoutLeft") >= 0)
					{
						widthtype = "fixedleft"
						rowCellXML.@hpostion = "left"
					}
					// Valign Horizonta postion--right
					//flexVerticalLayout flexVerticalLayoutRight 
					if (divcssstr.indexOf("flexVerticalLayout") >= 0 && divcssstr.indexOf("flexVerticalLayoutRight") >= 0)
					{
						widthtype = "fixedright"
						rowCellXML.@hpostion = "right"
					}
					//valign:top | center | bottom"
					//flexVerticalLayout flexMiddle flexVerticalLayoutBottom
					if (divcssstr.indexOf("flexVerticalLayoutBottom") >= 0)
					{
						rowCellXML.@valign = "bottom"
					}
					if (divcssstr.indexOf("flexVerticalLayoutTop") >= 0)
					{
						rowCellXML.@valign = "top"
					}
					if (divcssstr.indexOf("flexVerticalLayout") >= 0 && divcssstr.indexOf("flexCenter") >= 0)
					{
						rowCellXML.@valign = "center"
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

					if (rowCellXML.@hpostion == "center")
					{
						pardef = new XML("<pardef id=\"" + DominoGlobals.PardefId + "\" align=\"center\" keeptogether=\"true\" keepwithnext=\"true\" dominotype=\"dominotable\"/>");
					}
					if (rowCellXML.@hpostion == "left")
					{
						pardef = new XML("<pardef id=\"" + DominoGlobals.PardefId + "\" align=\"left\" keeptogether=\"true\" keepwithnext=\"true\" dominotype=\"dominotable\"/>");
					}
					if (rowCellXML.@hpostion == "right")
					{
						pardef = new XML("<pardef id=\"" + DominoGlobals.PardefId + "\" align=\"right\" keeptogether=\"true\" keepwithnext=\"true\" dominotype=\"dominotable\"/>");
					}
					if (!pardef)
					{
						pardef = new XML("<pardef id=\"" + DominoGlobals.PardefId + "\" align=\"left\" keeptogether=\"true\" keepwithnext=\"true\" dominotype=\"dominotable\"/>");

					}

					var par:XML = new XML("<par def=\"" + DominoGlobals.PardefId + "\" />");

					var parelementsXML:XMLList = null;
					var parchildXML:XML = null;
					var parchildCount:int = 0;
					var elementsXML:XMLList = rowCellXML.elements();

					var childCount:int = elementsXML.length();
					for (var i:int = 0; i < childCount; i++)
					{
						var childXML:XML = elementsXML[i];

						if (childXML.name() == "par")
						{

							parelementsXML = childXML.elements();
							parchildCount = parelementsXML.length();

							for (var n:int = 0; n < parchildCount; n++)
							{
								parchildXML = parelementsXML[n];

								if (parchildXML.@hidewhen.length() > 0)
								{

									pardef.@hidewhen = parchildXML.@hidewhen;
								}
							}
							if (parchildCount == 0)
							{
								this.deleteNode(childXML)
							} else
							{
								if (childXML.@hidewhen.length() > 0)
								{
									pardef = fixHideWhenwithField(childXML, pardef);
								}
							}
						}
						if (childXML.name() == "par" && childXML.@paragraph != "true")
						{
							parelementsXML = childXML.elements();
							parchildCount = parelementsXML.length();
							if (childXML.@hidewhen)
							{
								par.@hidewhen = childXML.@hidewhen;
							}
							for (var j:int = 0; j < parchildCount; j++)
							{
								parchildXML = parelementsXML[j];
								par.appendChild(parchildXML);
								//this.deleteNode(parchildXML);
							}

						}

						if (childXML.name() == "table")
						{
							if (childXML.@hpostion == "center")
							{
								if (_width)
								{
									//we need setting the parent tablecell hpostion
									//rowCellXML.@hpostion="center";
									var centerAlign:Number = 0
									var tableWidth:String = childXML.@refwidth
									if (tableWidth)
									{
										tableWidth = tableWidth.replace("in", "")
										var tableNumber:Number = Number(tableWidth);
										var diff:Number = this._width - tableNumber;
										if (diff < 0)
										{
											diff = 0
										} else
										{
											centerAlign = (diff / 2) as Number;
											var m:int = Math.pow(10, 4);
											centerAlign = Math.round(centerAlign * m) / m;
										}
										childXML.@leftmargin = centerAlign + "in"
										childXML.@widthtype = "fixedleft"
										childXML.@widthtypecache = "fixedcenter"
									}
								}
							}

						}
					}


					var par_elementsXML:XMLList = par.elements();
					var par_childCount:int = par_elementsXML.length();
					if (par_childCount >= 1)
					{
						rowCellXML.appendChild(pardef);
						rowCellXML.appendChild(par);
					} else
					{
						if (par_childCount == 0)
						{
							this.deleteNode(par);
						}
					}
				}
			}
			rowCellXML = removeEmptyParTag(rowCellXML);

			return rowCellXML;
		}

		private function removeEmptyParTag(rowCellXML:XML):XML
		{
			var elementsXML:XMLList = rowCellXML.elements();
			var childCount:int = elementsXML.length();
			for (var i:int = 0; i < childCount; i++)
			{
				var childXML:XML = elementsXML[i];
				if (childXML.name() == "par")
				{
					if (childXML.children().length() == 0)
					{
						this.deleteNode(childXML);
					}
				}
			}

			return rowCellXML;
		}


		/**
		 * This function will add the hidewhen formula of field to predef tag
		   So that this format will work with dxl of notes client.
		 */

		private function fixHideWhenwithField(fieldXML:XML, predefXML:XML):XML
		{
			if (fieldXML.@hidewhen && fieldXML.@hidewhen.length() > 0)
			{
				var code_xml:XML = new XML("<code event=\"hidewhen\" />");
				var formula_xml:XML = new XML("<formula>" + fieldXML.@hidewhen + "</formula>");
				code_xml.appendChild(formula_xml);
				//predefXML.@hidewhen=fieldXML.@hidewhen
				predefXML.appendChild(code_xml);
			}

			return predefXML;
		}

		private function deleteNode(value:XML):void
		{
			if (value == null)
			{
				return;
			}

			if (value.parent() == null)
			{
				return;
			}

			delete value.parent().children()[value.childIndex()];
		}
	}
}