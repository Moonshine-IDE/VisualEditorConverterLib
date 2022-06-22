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
	import components.NavigatorContent;

	import converter.DominoConverter;
	import components.common.Div;

	import interfaces.IComponent;
	import interfaces.IComponentData;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.components.IDiv;
	import interfaces.dominoComponents.IDominoTabView;
	import global.domino.DominoGlobals;

	/**
	* This class work for  convert from Visuale tabView  components  to target framework of body format.
	* Call different methods to convert the component to different target formats.
	* For now: 
	* toCode() will convert the  Visuale tabView  components     to domino tabView  dxl format.
	* toRoyaleConvertCode() :TODO
	* For Test Input&Output: 
	* Input :  - [Visuale UI main DominoTabView component](https://github.com/Moonshine-IDE/MockupVisualEditor/blob/features/issue_675_royale_generate_domino_visual_editor/src/view/domino/surfaceComponents/components/DominoTabView.as)
	* Output example:  Domino -  * <table widthtype="fitmargins" cellbordercolor="yellow" 				leftmargin="1in" cellborderstyle="ridge" 						colorstyle="solid" bgcolor="silver" insidewrap="true" 				insidewrapheight="1in"> 
	*			<border style="solid" width="2px" color="olive" 					dropshadow="true" /> 
	*			<tablecolumn width="66.58%" /> 
	*			<tablecolumn width="33.42%" /> 
	*			<tablerow> 
	*				<tablecell bgcolor="#e0ffbf"> 
	*					<pardef id="3" align="center" 									leftmargin="0.0313in" keepwithnext="true" 							keeptogether="true" /> 
	*					<par def="3"> 
	*						<picture height="341px" width="218px" 								alttext="caldesigns white two-piece 								dress"> 
	*							<imageref name="design1.jpg" /> 
	*							<caption>CALDesigns</caption>
	*						</picture> 
	*					</par> 
	*				</tablecell> 
	*				<tablecell colorstyle="vgradient" bgcolor="none" 						altbgcolor="#a1e2ff"> 
	*					<pardef id="4" align="center" 									leftmargin="0.0313in" keepwithnext="true" 							keeptogether="true" /> 
	*					<par def="4" /> 
	*					<pardef id="5" leftmargin="0.0313in" 							keepwithnext="true" keeptogether="true" /> 
	*					<par def="5"> 
	*						<run> 
	*							<font size="24pt" color="blue" /> 
	*							$250 
	*						</run> 
	*					</par> 
	*				</tablecell> 
	*			</tablerow> 
	*			<tablerow> 
	*				<tablecell bgcolor="#ffe1dc"> 
	*					<pardef id="6" leftmargin="0.0313in" 							keepwithnext="true" keeptogether="true" /> 
	*					<par def="6"> 
	*						<imagemap lastdefaultid="8" 									lastcircleid="1" lastrectangleid="55"> 
	*							<picture height="341px" width="219px" 									alttext="PERDesigns pink two-piece 									sleeveless dress"> 
	*								<border style="dot" width="1px" 										color="#ff4040" /> 
	*								<imageref name="design2.jpg" /> 
	*								<caption>PERDesigns</caption> 
	*							</picture> 
	*							<area type="circle" htmlid="bracelet">
	*								<point x="5" y="82" /> 
	*								<point x="81" y="158" /> 
	*								<urllink href="http://www.PERD
	*								esigns.com/jewelry" /> 
	*							</area> 
	*						</imagemap> 
	*					</par> 
	*				</tablecell> 
	*				<tablecell> 
	*					<cellbackground repeat="hrepeat"> 
	*						<imageref name="graphic.gif" /> 
	*					</cellbackground>
	*					<par def="5" /> 
	*					<par> 
	*						<run> 
	*							<font size="24pt" color="blue" /> 
	*							$300 
	*						</run> 
	*					</par> 
	*				</tablecell> 
	*			</tablerow> 
	*		</table> 
	*
	* Royale - TODO
	* 					
	* {@link #components.domino}
	* @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_TABLEROW_ELEMENT_XML.html
	*/

	public class DominoTabView extends ComponentBase implements IDominoTabView, IRoyaleComponentConverter, IComponentData
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "tabView";
        public static const ELEMENT_NAME:String = "TabView";
		public static const ROYALE_XML_ELEMENT:String = "TabBar";
		
		private var _component:IComponent;

		private var _parDefNum:Number=0;

		public function DominoTabView(component:IComponent = null)
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
		
		private var _selectedIndex:int;

		public function get selectedIndex():int
		{
			return _selectedIndex;
		}

		public function set selectedIndex(value:int):void
		{
			_selectedIndex = value;
		}
		
		public function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function getComponentData():Object
		{
			var fields:Array = [];

			var elementCount:int = component["numElements"];
			for (var i:int = 0; i < elementCount; i++)
			{
				var navContent:Object = component["getElementAt"](i);
				var content:IDiv = navContent.getElementAt(0);
					content = content["getElementAt"](0);
				for (var j:int = 0; j < content["numElements"]; j++)
				{
					var element:IComponentData = content["getElementAt"](j) as IComponentData;
					if (element == null)
					{
						continue;
					}

					var componentData:Object = element.getComponentData();
					fields.push(componentData);
				}
			}

			return {
				fields: fields
			}
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			var localSurface:ISurface = surface;

			this.setComponentSize(xml);

			this.columnProperties=xml.@columsProperty;
			
			if ("@orientation" in xml)
            {
                this.orientation = xml.@orientation == "" ? "top" : xml.@orientation;
            }
            this.scrollable = xml.@scrollable == "true";

            var tabsXML:XMLList = xml.elements("tab");
            var tabsCount:int = tabsXML.length();

			//Alert.show("96:"+tabsCount);
            for(var i:int = 0; i < tabsCount; i++)
            {
                var tabXML:XML = tabsXML[i];
                var tabChildren:XMLList = tabXML.Div;

                var tab:IComponent = DominoConverter.getNewInstanceOfComponent(lookup, NavigatorContent.NAVIGATORCONTENT_NAME);
               	if (tab)
				{
					tab["label"] = tabXML.@title;
					if (tabChildren.length() == 0)
					{
						var internalDiv:Object = DominoConverter.getNewInstanceOfComponent(lookup, Div.ELEMENT_NAME);
						tab["addElement"](internalDiv);
					}
					
					component["addElement"](tab);
					this.tabFromXML(tab, tabXML, childFromXMLCallback, localSurface, lookup);
				}
			}
			
			component["selectedIndex"] = xml.@selectedIndex;
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

		private var _refwidth:String;
		public function get refwidth():String
		{
			return _refwidth;
		}
		public function set refwidth(value:String):void
		{
			_refwidth = value;
		}

		private var _widthIn:Number=0
		public function get widthIn():Number
		{
			return _widthIn;
		}
		public function set widthIn(value:Number):void
		{
			_widthIn = value;
		}

		/**
		<table rowdisplay='tabs' leftmargin='0.0104in' widthtype='fixedleft' refwidth='8.8528in'>

		<tablecolumn
		width='8.8528in'/>
		<tablerow tablabel='Company'>
		<tablecell></tablecell>
		</tablerow>
		</table
		*/

		private var _columnProperties:String;
		public function get columnProperties():String
		{
			return _columnProperties;
		}
		public function set columnProperties(value:String):void
		{
			_columnProperties = value;
		}
 		
		
		public function toCode():XML
		{
			var columnArrTemp:Array = null;
			if(this.columnProperties!= null && this.columnProperties.length>0){
				columnArrTemp= this.columnProperties.split(",");
			}
			
			//Alert.show("width:"+this.width);
			if(this.width&&this.width>0){
				this.widthIn=(this.width/96) as Number;
				var m:int = Math.pow(10, 4);
    			this.widthIn=Math.round(this.widthIn * m) / m;
				
			}

			//Alert.show("widthIn:"+widthIn);

			if(this.widthIn==0){
				this.widthIn=4
			}
			
			var xml:XML = new XML("<table rowdisplay='tabs' ></table>");
			var tableColumnXml:XML = new XML("<tablecolumn width='"+this.widthIn+"in' />");
			xml.appendChild(tableColumnXml);
			var tableColumnNumElements:int = 0;
			
			//add attirive
			if(this.widthtype != null){
				xml.@widthtype=this.widthtype.toString();
			}else{
				xml.@widthtype="fixedleft";
			}
			if(this.minrowheight != null){
				xml.@minrowheight=this.minrowheight;
			}

            var tabCount:int = component["numElements"];
            for (var i:int = 0; i < tabCount; i++)
            {
                var content:Object = component["getElementAt"](i);
                var contentCount:int = content.numElements;

                var tab:XML = new XML("<tablerow />");
               
                tab.@tablabel = content.label;

				var tabcell:XML = new XML("<tablecell />");

                for (var j:int = 0; j < contentCount; j++)
                {
                    var component:IComponent = content.getElementAt(j) as IComponent;
                    if (component === null)
                    {
                        continue;
                    }

                    tabcell.appendChild(component.toCode());
                }
				tab.appendChild(tabcell)

                xml.appendChild(tab);
            }
			 xml=this.removeDiv(xml,null);
			 xml=this.removePar(xml,null);
			 xml=this.addPar(xml,null);
			 xml=this.removeBlankPar(xml,null);
			 //xml=this.fixField(xml,null);
            return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var jewelNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			var fxNamespace:Namespace = new Namespace("fx", "http://ns.adobe.com/mxml/2009");
			var jsNamespace:Namespace = new Namespace("js", "library://ns.apache.org/royale/basic");

			var rootContainerXML:XML = new XML("<VGroup />");
				rootContainerXML.setNamespace(jewelNamespace);
				rootContainerXML.@itemsVerticalAlign = "itemsCenter";

			var tabsRootXML:XML = new XML("<" +ROYALE_XML_ELEMENT+ "/>");
            	tabsRootXML.setNamespace(jewelNamespace);

			rootContainerXML.appendChild(tabsRootXML);

			var tabsDpXML:XML = new XML("<dataProvider/>");
				tabsDpXML.setNamespace(jewelNamespace);

			var tabsDpArrayListXML:XML = new XML("<ArrayList />");
				tabsDpArrayListXML.setNamespace(jsNamespace);

			tabsDpXML.appendChild(tabsDpArrayListXML);
			tabsRootXML.appendChild(tabsDpXML);

			var beadsXml:XML = new XML("<beads/>");
				beadsXml.setNamespace(jewelNamespace);
			
			var tabsAssignTabRootXML:XML = new XML("<AssignTabContent/>");
				tabsAssignTabRootXML.setNamespace(jewelNamespace);
				tabsAssignTabRootXML.@selectedContentProperty="hash";

			beadsXml.appendChild(tabsAssignTabRootXML);

			var tabBarContentRootXML:XML = new XML("<content/>");
				tabBarContentRootXML.setNamespace(jewelNamespace);

			tabsAssignTabRootXML.appendChild(tabBarContentRootXML);

			var tabsContentXML:XML = new XML("<TabBarContent/>");
			tabsContentXML.setNamespace(jewelNamespace);

			var tabCount:int = component["numElements"];
			var prefixTab:String = "tab";

			for (var i:int = 0; i < tabCount; i++)
            {
                var content:IComponent = component["getElementAt"](i);

				var dpObjXML:XML = new XML("<Object />");
					dpObjXML.@label = content["label"];
					dpObjXML.@hash = prefixTab + i;
					dpObjXML.setNamespace(fxNamespace);

				tabsDpArrayListXML.appendChild(dpObjXML);

                var tabSection:XML = new XML("<SectionContent/>");
                tabSection.setNamespace(jewelNamespace);
                tabSection.@name = prefixTab + i;

				var contentCount:int = content["numElements"];
				for (var j:int = 0; j < contentCount; j++)
				{
					var component:IRoyaleComponentConverter = content["getElementAt"](j) as IRoyaleComponentConverter;
					if (component === null)
					{
						continue;
					}

					tabSection.appendChild(component.toRoyaleConvertCode());
				}

				tabsContentXML.appendChild(tabSection);
			}

			tabBarContentRootXML.appendChild(tabsContentXML);
			tabsRootXML.appendChild(beadsXml);

			return rootContainerXML;
		}

		private function tabFromXML(tab:IComponent, xml:XML, callback:Function, surface:ISurface, lookup:ILookup):void
        {
			var localLookup:ILookup = lookup;
			var localSurface:ISurface = surface;

            var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            var container:Object;

            if (tab["numElements"] > 0)
            {
                container = tab["getElementAt"](0);
            }
            for(var i:int = 0; i < childCount; i++)
            {
                var childXML:XML = elementsXML[i];
                if (container)
                {
                    callback(container, localLookup, childXML, localSurface);
                }
                else
                {
                    container = DominoConverter.getNewInstanceOfComponent(lookup, Div.ELEMENT_NAME);
                    container.fromXML(childXML, callback, localSurface, lookup);

                    tab["addElement"](container);
                }
            }
        }

		private function removeDiv(xml:XML,rootXML:XML=null):XML
		{
			var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();

			if(xml.name()=="div"&& rootXML!=null && rootXML.name()=="tablecell"){
				
				if(rootXML.name()=="tablecell"){
					var divcssstr:String = xml["@class"];
					var widthtype:String = "fixedright";

					if(divcssstr){
						//Alert.show("divcssstr:"+divcssstr);
						
						if(divcssstr.indexOf("flexHorizontalLayoutRight")>=0){
							widthtype="fixedright"
							rootXML.@hpostion="right"
						}
						if(divcssstr.indexOf("flexHorizontalLayoutLeft")>=0){
							widthtype="fixedleft"
							//rootXML.@leftmargin="0"
							rootXML.@hpostion="left"
						}

						if(divcssstr.indexOf("flexCenter")>=0){
							widthtype="fixedcenter"
							rootXML.@hpostion="center"
							//rootXML.@centermargin="0"
						}

						//Valign -------
						//Valign Horizonta postion--center
						if(divcssstr.indexOf("flexVerticalLayout")>=0 &&divcssstr.indexOf("flexMiddle")>=0 ){
							widthtype="fixedcenter"
							rootXML.@hpostion="center"
							//rootXML.@centermargin="0"
						}
						// Valign Horizonta postion--left
						//flexVerticalLayout flexVerticalLayoutLeft
						if(divcssstr.indexOf("flexVerticalLayout")>=0 &&divcssstr.indexOf("flexVerticalLayoutLeft")>=0 ){
							widthtype="fixedleft"
							rootXML.@hpostion="left"
						}
						// Valign Horizonta postion--right
						//flexVerticalLayout flexVerticalLayoutRight 
						if(divcssstr.indexOf("flexVerticalLayout")>=0 &&divcssstr.indexOf("flexVerticalLayoutRight")>=0 ){
							widthtype="fixedright"
							rootXML.@hpostion="right"
						}
						//valign:top | center | bottom"
						//flexVerticalLayout flexMiddle flexVerticalLayoutBottom
						if(divcssstr.indexOf("flexVerticalLayoutBottom")>=0){
							rootXML.@valign="bottom"
						}
						if(divcssstr.indexOf("flexVerticalLayoutTop")>=0){
							rootXML.@valign="top"
						}
						if(divcssstr.indexOf("flexVerticalLayout")>=0 && divcssstr.indexOf("flexCenter")>=0){
							rootXML.@valign="center"
						}

						//flexVerticalLayoutBottom
						
					}
					//Alert.show("rootXML.@hpostion:"+rootXML.@hpostion);

					rootXML.@direction=xml.@direction;
					// if(xml.@vpostion!=""){
					// 	rootXML.@vpostion=xml.@vpostion;
					// }
					// if(xml.@hpostion!=""){
					// 	rootXML.@hpostion=xml.@hpostion
					// }
				}
				for(var i:int = 0; i < childCount; i++)
				{
					var childXML:XML = elementsXML[i];
					if(childXML.name()=="table"){
						childXML.@widthtype=widthtype
						if(widthtype=="fixedleft"){
							//childXML.@leftmargin="0";
							delete childXML.@rightmargin;
						}
						if(widthtype=="fixedright"){
							//childXML.@rightmargin="0"
							delete childXML.@leftmargin;
						}
					}

				
					rootXML.appendChild(childXML);
				}
			
			
				this.deleteNode(xml);
				//return rootXML
				
			}else{
				for(var p:int = 0; p < childCount; p++){
					var pchildXML:XML = elementsXML[p];

					if(pchildXML.name()=="div"){
						rootXML=xml;
					}
					var childelementsXML:XMLList = pchildXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childCount2>0){
						this.removeDiv(pchildXML,rootXML)
					}
				}
			}
			return xml;
		}

		private function removePar(xml:XML,rootXML:XML=null):XML{
			var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();

			//_addpar=checkTabViewCell(xml)
			
			// var classProperty:string =;
			if(xml.name()=="par"&& rootXML!=null && xml.@paragraph!="true"){
				//Alert.show("length:"+xml.attribute("class"));
				if(_addpar==true){
					//Alert.show("paragraph:"+xml.@paragraph);
					for(var i:int = 0; i < childCount; i++)
					{
						var childXML:XML = elementsXML[i];
						rootXML.appendChild(childXML);
					}
					this.deleteNode(xml);
				}
				//return rootXML
				
			}else{
				for(var n:int = 0; n < childCount; n++){
					var nchildXML:XML = elementsXML[n];
					//Alert.show("261:"+childXML.name())
					if(nchildXML.name()=="tablerow"&&nchildXML.@tablabel.length()>0){
						_addpar=true
					}
					if(nchildXML.name()=="tablerow"&&nchildXML.@tablabel.length()==0){
						_addpar=false
					}

					if(nchildXML.name()=="tablecell"&&nchildXML.@direction=="Horizontal"){
						_addpar=false
					}

					
					
					//tablabel
				
					var childelementsXML:XMLList = nchildXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childCount2>0){
						this.removePar(nchildXML,rootXML)
					}
				}
			}

			return xml;
		}

		private var _addpar:Boolean=false;
		private function addPar(xml:XML,rootXML:XML=null):XML{
			var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();

			if(xml.name()=="tablecell"&& rootXML!=null && xml.@direction=="Horizontal"){
				//Alert.show(""+elementsXML[0].name());
				if(_addpar==true||elementsXML[0].name()=="table"){
					DominoGlobals.PardefId++
					var pardef:XML;

					if(xml.@hpostion=="center"){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"center\" dominotype=\"tabView\"/>");
					}
					if(xml.@hpostion=="left"){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"left\" dominotype=\"tabView\"/>");
					}
					if(xml.@hpostion=="right"){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"right\" dominotype=\"tabView\"/>");
					}
					if(!pardef){
						pardef = new XML("<pardef id=\""+DominoGlobals.PardefId+"\" align=\"left\" dominotype=\"tabView\"/>");
				
					}
					
						var par:XML = new XML("<par def=\""+DominoGlobals.PardefId+"\" />");
					_parDefNum++;
					xml.appendChild(pardef);
					for(var i:int = 0; i < childCount; i++)
					{
						var childXML:XML = elementsXML[i];

						if(childXML.name()=="par"){
							//Alert.show("paragraph:"+childXML.@paragraph)
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
							if(childXML.@widthtype=="fixedcenter"){
								//we need setting the parent tablecell hpostion
								xml.@hpostion="center";
								var centerAlign:Number=0
								var tableWidth:String=childXML.@refwidth
								if(tableWidth){
									tableWidth=tableWidth.replace("in","")
									var tableNumber:Number = Number(tableWidth);
									var diff:Number=this.widthIn-tableNumber;
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

								//fix aligh widthIn
							}
							//fix center 
							//	childXML.@leftmargin="0"
						}
					
						//this.deleteNode(childXML);
					}
					xml.appendChild(par);
				}
				//this.deleteNode(xml);
				//return rootXML
				
			}else{
				for(var h:int = 0; h < childCount; h++){
					var hchildXML:XML = elementsXML[h];
					//Alert.show("261:"+childXML.name())
					if(hchildXML.name()=="tablecell"){
						rootXML=xml;
					}

					
					if(hchildXML.name()=="tablerow"&&hchildXML.@tablabel.length()>0){
						_addpar=true
					}
					if(hchildXML.name()=="tablerow"&&hchildXML.@tablabel.length()==0){
						_addpar=false
					}

				
					
					var childelementsXML:XMLList = hchildXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childCount2>0){
						this.addPar(hchildXML,rootXML)
					}
				}
			}

			

			return xml;

			

		}


		private function removeBlankPar(xml:XML,rootXML:XML=null):XML{
			var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();

			//_addpar=checkTabViewCell(xml)
			
			
			if(xml.name()=="par"&& childCount==0){
				this.deleteNode(xml);
				//return rootXML
				
			}else{
				for(var i:int = 0; i < childCount; i++){
					var childXML:XML = elementsXML[i];
					
				
					var childelementsXML:XMLList = childXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childXML.name()=="par"&& childCount2==0){
						this.deleteNode(childXML);
					}else{
						if(childCount2>0){
							this.removeBlankPar(childXML,rootXML)
						}
					}
					
				}
			}

			

			return xml;

			

		}
		private var _tablecellLayout:String="";
		private function fixField(xml:XML,rootXML:XML=null):XML{
			var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();

			//_addpar=checkTabViewCell(xml)
			
			
			if(xml.name()=="field"&& _tablecellLayout=="Horizontal"&& rootXML!=null){
				
				//return rootXML
				  var run:XML = new XML("<run />");
				  run.appendChild(xml);
				  rootXML.appendChild(run);
				
			}else{
				for(var i:int = 0; i < childCount; i++){
					var childXML:XML = elementsXML[i];
					//Alert.show("261:"+childXML.name())
					if(childXML.name()=="tablecell"){
						rootXML=xml;
					}

					if(childXML.name()=="tablecell"&&childXML.@direction=="Horizontal"){
						_tablecellLayout="Horizontal"
					}
					if(childXML.name()=="tablecell"&&childXML.@direction=="Vertical"){
						_tablecellLayout="Vertical"
					}
					if(childXML.name()=="tablecell"&&childXML.@direction==""){
						_tablecellLayout="Vertical"
					}

					if(childXML.name()=="field"&& _tablecellLayout=="Horizontal"){
				
						//return rootXML
						var newrun:XML = new XML("<run />");
						newrun.appendChild(childXML);
						xml.appendChild(newrun);
					}
			
				
					
					var childelementsXML:XMLList = childXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childCount2>0){
						this.fixField(childXML,rootXML)
					}
				}
			}

			return xml;
		}

		private function deleteNode(value:XML):void
		{
			if(value==null)
			{
				return;
			}

			if(value.parent()==null)
			{
				return;
			}

			delete value.parent().children()[value.childIndex()];
		}

	

		private function checkTabViewCell(xml:XML):Boolean
		{
			 //<tablerow tablabel="Tab">
			 var flag:Boolean=false;
			// if(xml.name()=="table"&&xml.@rowdisplay=="tabs"){
			// 		flag=true
			// }
		

			if(xml.name()=="tablerow"&&xml.@tablabel.length()>0){
					flag=true
			}
			if(xml.name()=="tablerow"&&xml.@tablabel.length()==0){
					flag=false
			}

			return flag;
		}
	}
}