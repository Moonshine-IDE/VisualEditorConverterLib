package components.domino
{
	import components.ComponentBase;
	import components.NavigatorContent;

	import converter.Converter;
	import converter.DominoConverter;
	import components.primeFaces.Div;

	import interfaces.IComponent;
	import interfaces.components.ITabView;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;

	import mx.controls.Alert;

	public class DominoTabView extends ComponentBase implements ITabView
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "tabView";
        public static const ELEMENT_NAME:String = "TabView";
		
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

			var dominoconv:DominoConverter = DominoConverter.getInstance();
			//Alert.show("96:"+tabsCount);
            for(var i:int = 0; i < tabsCount; i++)
            {
                var tabXML:XML = tabsXML[i];
                var tabChildren:XMLList = tabXML.Div;

                var tab:IComponent = dominoconv.getNewInstanceOfComponent(NavigatorContent.NAVIGATORCONTENT_NAME);
                if(tab==null){
					Alert.show("tab is null")
				}else{
					tab["label"] = tabXML.@title;
					if (tabChildren.length() == 0)
					{
						var internalDiv:Object = dominoconv.getNewInstanceOfComponent(Div.ELEMENT_NAME);
						tab["addElement"](internalDiv);
					}
					
					component["addElement"](tab);
					//Alert.show("111:"+i);
					this.tabFromXML(tab, tabXML, childFromXMLCallback);
	
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

		/**
		<table rowdisplay='tabs' leftmargin='0.0104in' widthtype='fixedleft' refwidth='8.8528in'>

		<tablecolumn
		width='8.8528in'/>
		<tablerow tablabel='Company'>
		<tablecell></tablecell>
		</tablerow>
		</table


 */
 		
		
		public function toCode():XML
		{
			var widthIn:Number=0
			if(this.width&&this.width>0){
				widthIn=(this.width/96).toFixed(4) as Number
				
			}

			if(widthIn==0){
				widthIn=4
			}
			
			var xml:XML = new XML("<table rowdisplay='tabs' ></table>");
			var tableColumnXml:XML = new XML("<tablecolumn width='"+widthIn+"in' />");
			xml.appendChild(tableColumnXml);
			var tableColumnNumElements:int = 0;
			
			//add attirive
			if(this.widthtype != null){
				xml.@widthtype=this.widthtype.toString();
			}else{
				xml.@widthtype="fixedleft"
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
			 xml=this.fixField(xml,null);
            return xml;
		}

		private function tabFromXML(tab:IComponent, xml:XML, callback:Function):void
        {
            var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            var container:Object;
			var dominoconv:DominoConverter = DominoConverter.getInstance();
            if (tab["numElements"] > 0)
            {
                container = tab["getElementAt"](0);
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
                    container = dominoconv.getNewInstanceOfComponent(Div.ELEMENT_NAME);
                    container.fromXML(childXML, callback);

                    tab["addElement"](container);
                }
            }
        }

		private function removeDiv(xml:XML,rootXML:XML=null):XML{
			var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();

			
			
			
			if(xml.name()=="div"&& rootXML!=null){
				for(var i:int = 0; i < childCount; i++)
				{
					var childXML:XML = elementsXML[i];
					rootXML.appendChild(childXML);
				}
				rootXML.@direction=xml.@direction
				this.deleteNode(xml);
				//return rootXML
				
			}else{
				for(var i:int = 0; i < childCount; i++){
					var childXML:XML = elementsXML[i];
					//Alert.show("261:"+childXML.name())
					if(childXML.name()=="div"){
						rootXML=xml;
					}
					var childelementsXML:XMLList = childXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childCount2>0){
						this.removeDiv(childXML,rootXML)
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
					for(var i:int = 0; i < childCount; i++)
					{
						var childXML:XML = elementsXML[i];
						rootXML.appendChild(childXML);
					}
					this.deleteNode(xml);
				}
				//return rootXML
				
			}else{
				for(var i:int = 0; i < childCount; i++){
					var childXML:XML = elementsXML[i];
					//Alert.show("261:"+childXML.name())
					if(childXML.name()=="tablerow"&&childXML.@tablabel.length()>0){
						_addpar=true
					}
					if(childXML.name()=="tablerow"&&childXML.@tablabel.length()==0){
						_addpar=false
					}

					if(childXML.name()=="tablecell"&&childXML.@direction=="Horizontal"){
						_addpar=false
					}

					
					
					//tablabel
				
					var childelementsXML:XMLList = childXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childCount2>0){
						this.removePar(childXML,rootXML)
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
					var pardef:XML = new XML("<pardef id=\""+_parDefNum+"\" align=\"left\" />");
					var par:XML = new XML("<par def=\""+_parDefNum+"\" />");
					_parDefNum++;
					xml.appendChild(pardef);
					for(var i:int = 0; i < childCount; i++)
					{
						var childXML:XML = elementsXML[i];

						if(childXML.name()=="par"){
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
								childXML.@leftmargin="0"
						}
					
						//this.deleteNode(childXML);
					}
					xml.appendChild(par);
				}
				//this.deleteNode(xml);
				//return rootXML
				
			}else{
				for(var i:int = 0; i < childCount; i++){
					var childXML:XML = elementsXML[i];
					//Alert.show("261:"+childXML.name())
					if(childXML.name()=="tablecell"){
						rootXML=xml;
					}

					
					if(childXML.name()=="tablerow"&&childXML.@tablabel.length()>0){
						_addpar=true
					}
					if(childXML.name()=="tablerow"&&childXML.@tablabel.length()==0){
						_addpar=false
					}

				
					
					var childelementsXML:XMLList = childXML.elements();
					var childCount2:int = childelementsXML.length();
					if(childCount2>0){
						this.addPar(childXML,rootXML)
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
						var run:XML = new XML("<run />");
						run.appendChild(childXML);
						xml.appendChild(run);
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

		private function deleteNode(value:XML)
		{

			if(value==null){return;}
			if(value.parent()==null){return;}
			delete value.parent().children()[value.childIndex()]
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

			if(flag==true){
				Alert.show("xml.name:"+xml.name());
				Alert.show("xml.tablabel:"+xml.@tablabel+":");

			}


			// if(xml.name()=="table"&&(xml.@rowdisplay==null||xml.@rowdisplay=="")){
			// 	flag=false
			// }

			return flag;
					
		}
	}
}