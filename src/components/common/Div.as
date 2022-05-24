package components.common
{
	import components.ComponentBase;

	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.components.IDiv;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import flash.utils.getQualifiedClassName;

	import global.domino.DominoGlobals;
	
	public class Div extends ComponentBase implements IDiv, IRoyaleComponentConverter
	{
		private static const PRIME_FACES_XML_ELEMENT_NAME:String = "div";
		private static const Domino_XML_ELEMENT_NAME:String = "par";
    	public static var ELEMENT_NAME:String = "Div";
		private static const ROYALE_HORIZONTAL_XML_ELEMENT_NAME:String="HGroup";
		private static const ROYALE_VERTICAL_XML_ELEMENT_NAME:String="VGroup";
		public  var isDomino:Boolean = false;

		private var _component:IComponent;

		private var _xml:XML;
		
		public function Div(component:IComponent = null)
		{
			super();
			
			this._component = component;
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
				
		private var _cssClass:String = "flexHorizontalLayout flexHorizontalLayoutLeft flexHorizontalLayoutTop";
		public function get cssClass():String
		{
			return _cssClass;
		}
		
		public function set cssClass(value:String):void
		{
			_cssClass = value;	
		}

		private var _direction:String = "Horizontal";
		public function get direction():String
		{
			return _direction;
		}
		
		public function set direction(value:String):void
		{
			_direction = value;	
		}

		private var _vdirection:String;
		public function get vdirection():String
		{
			return _vdirection;
		}
		
		public function set vdirection(value:String):void
		{
			_vdirection = value;	
		}	
		
		private var _label:String;
		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}
		
		private var _wrap:Boolean;
		public function get wrap():Boolean
		{
			return _wrap;
		}		
		
		public function set wrap(value:Boolean):void
		{
			_wrap = value;
		}		
		
		private function get component():IComponent
		{
			return _component ? _component : this;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface,  lookup:ILookup):void
		{
			var localSurface:ISurface = surface;

			this._xml = xml;
			
			setComponentSize(xml);
			
			this.wrap = xml.@wrap == "true";
			if (xml.@["class"])
			{
				this._cssClass = xml.@["class"];
			}
	
            var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            for(var i:int = 0; i < childCount; i++)
            {
                var childXML:XML = elementsXML[i];
                childFromXMLCallback(component, lookup, childXML, localSurface);
            }
		}
		
		public function toCode():XML
		{
			var xml:XML 
			if(isDomino)
			{
				xml = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, Domino_XML_ELEMENT_NAME) + "/>");
			}
			else
			{
				xml = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
				CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);

				///TODO: Adjust for Visual Editor
				xml["@class"] = _cssClass;
			}

			
			if(!direction){
				xml.@direction="Horizontal"
			}else{
				xml.@direction=direction
			}

			if(!vdirection){
				xml.@vdirection="Vertical"
			}else{
				xml.@vdirection=vdirection
			}

            var elementCount:int = component["numElements"];
            for(var i:int = 0; i < elementCount; i++)
            {
                DominoGlobals.PardefDivId++;
				var element:IComponent = component["getElementAt"](i) as IComponent;
               
			    var className:String=getQualifiedClassName(element);

				//Alert.show("className:"+className);
             
				if(className=="view.domino.surfaceComponents.components::DominoParagraph"){
					
					xml.appendChild(toPerDefCode(element.toCode()));
				}

				if(className=="view.domino.surfaceComponents.components::DominoLabel" || 
				className=="view.domino.surfaceComponents.components::DominoInputText" ||
				className=="view.domino.surfaceComponents.components::DominoButton" ||
				className=="view.domino.surfaceComponents.components::DominoComputedText" ||
				className=="view.domino.surfaceComponents.components::DominoSection" ||
				className=="view.domino.surfaceComponents.components::DominoTable"||
				className=="view.domino.surfaceComponents.components::DominoTabView"){
					xml.appendChild(toHidePerDefCode(element.toCode()));
				
				}

				

				
				//fix domino table postin with the div
				if(className=="view.domino.surfaceComponents.components::DominoTable"){
					if(xml.@hpostion=="left"){
						element["widthtype"]="fixedleft"
						//element["leftmargin"]="0"
					}

					if(xml.@hpostion=="right"){
					
						element["widthtype"]="fixedright"
						//element["rightmargin"]="0"
					
					}
					if(xml.@hpostion=="center"){
						element["widthtype"]="fixedcenter"
					
					}

					//fixedcenter
					
				}
			   
			    xml.appendChild(element.toCode());
            }

            return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var componentXML:XML = new XML("<" + ROYALE_HORIZONTAL_XML_ELEMENT_NAME + "/>");

			var royaleNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
            componentXML.setNamespace(royaleNamespace);

			if(direction == "Vertical")
			{
				componentXML = new XML("<" + ROYALE_VERTICAL_XML_ELEMENT_NAME + "/>");
			}

			var elementCount:int = component["numElements"];
            for(var i:int = 0; i < elementCount; i++)
            {
				var element:IRoyaleComponentConverter = component["getElementAt"](i) as IRoyaleComponentConverter;
				if (element == null)
				{
					continue;
				}
				componentXML.appendChild((element as IRoyaleComponentConverter).toRoyaleConvertCode());
            }

			return componentXML;
		}

		public function toPerDefCode( xml:XML):XML
		{
			var prefdef_str:String="";
			var vprefdef_str:String="";
		
			//Alert.show("toPerDefCode:"+xml.toXMLString());
			if(xml!=null){
				var cssstr:String=xml.@["class"];
				if(cssstr.indexOf("flexHorizontalLayoutRight")>=0){
					prefdef_str=" align=\"right\""
				}
				if(cssstr.indexOf("flexHorizontalLayoutLeft")>=0){
					prefdef_str=" align=\"left\""
				}
				//flexHorizontalLayout
				if(cssstr.indexOf("flexCenter")>=0){
					prefdef_str=" align=\"center\""
				}

				if(cssstr.indexOf("flexVerticalLayoutBottom")>=0){
					vprefdef_str=" valign=\"bottom\""
				}
				if(cssstr.indexOf("flexVerticalLayoutTop")>=0){
					vprefdef_str=" valign=\"top\""
				}
				if(cssstr.indexOf("flexVerticalLayout")>=0&&cssstr.indexOf("flexCenter")>=0){
					vprefdef_str=" valign=\"center\""
				}
				//flexVerticalLayoutBottom
				//flexVerticalLayoutTop
				//flexCenter && flexVerticalLayout


			}else{
				prefdef_str=" align=\"left\" "
				vprefdef_str=" valign=\"top\""
			}

			var pardefXml:XML = new XML("<pardef id=\""+DominoGlobals.PardefDivId+"\" "+prefdef_str+" "+vprefdef_str+" dominotype=\"domino\"/>" );
			if(xml.@hidewhen&& xml.@hidewhen!=""){
				//Alert.show("xml.@hidewhen:"+xml.@hidewhen+":"+xml.@hidewhen.length());
				if(xml.@hidewhen.length()>0){
					var code_xml:XML = new XML("<code event=\"hidewhen\" />");
					var formula_xml:XML = new XML("<formula>"+xml.@hidewhen+"</formula>");
					code_xml.appendChild(formula_xml);
					pardefXml.appendChild(code_xml);
				}

			} 

			if(xml.@hide&& xml.@hide!=""){
				pardefXml.@hide=xml.@hide;
			}
			return pardefXml;
		}

		public function toHidePerDefCode( xml:XML):XML
		{
			if(xml!=null){
				var pardefXml:XML = new XML("<pardef id=\""+DominoGlobals.PardefDivId+"\" "+" dominotype=\"dominoHide\" keeptogether=\"true\" keepwithnext=\"true\"/>" );
				if(xml.@hide&& xml.@hide!=""){
					pardefXml.@hide=xml.@hide;
					xml.@def=DominoGlobals.PardefDivId;
					//arond a new par for the traget element 
					
				}
			}

			return pardefXml;
		}
	}
}