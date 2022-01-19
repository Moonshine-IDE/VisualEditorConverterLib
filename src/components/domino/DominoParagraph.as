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

	import interfaces.IComponent;
	import interfaces.components.IDominoParagraph;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;


    import mx.controls.Alert;

	import global.domino.DominoGlobals;
	import mx.utils.Base64Decoder;
	import  flash.utils.ByteArray;


	/**
	* This class work for  convert from paragraph element of Visuale label/text/field  components  to target framework of body format.
	* Call different methods to convert the component to different target formats.
	* For now: 
	* toCode() will convert the  paragraph element    to domino calandar  dxl format.
	* toRoyaleConvertCode() will  convert the Visuale main container components to Rayale button format.
	* For Test Input&Output: 
	* Input : Visuale UI  paragraph element   from Visual Editor
	* Output example:	Domino - <par def="1019" paragraph="true" dominotype="paragraph" class="flexHorizontalLayout flexHorizontalLayoutLeft flexHorizontalLayoutTop"/>
	* 					Royale - TODO
	* 					
	* {@link #components.domino}
	*/
	
	public class DominoParagraph extends ComponentBase implements IDominoParagraph
	{
		private static const PRIME_FACES_XML_ELEMENT_NAME:String = "par";
    	public static var ELEMENT_NAME:String = "Par";

		private var _component:IComponent;

		private var _xml:XML;
		
		public function DominoParagraph(component:IComponent = null)
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
		
		private var _hidewhenFormula:String;
		public function get hidewhenFormula():String
		{
			return _hidewhenFormula;
		}

		public function set hidewhenFormula(value:String):void
		{
			_hidewhenFormula = value;
		}

		private var parid:int;
		
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
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this._xml = xml;
			
			setComponentSize(xml);
			
			this.wrap = true;
			if (xml.@["class"])
			{
				this._cssClass = xml.@["class"];
			}
			if (xml.@["hidewhen"]){

				this.hidewhenFormula=base64Decode(xml.@["hidewhen"]);
			}
			
			
	
            var elementsXML:XMLList = xml.elements();
            var childCount:int = elementsXML.length();
            for(var i:int = 0; i < childCount; i++)
            {
                var childXML:XML =elementsXML[i];
				//Alert.show("100:"+childXML.@size);
                childFromXMLCallback(component, childXML);
            }
		}
		
		public function toCode():XML
		{
			var parxml:XML=new XML();
			
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + " def=\""+DominoGlobals.PardefDivId+"\"  paragraph=\"true\" />");
			//flexHorizontalLayoutRight flexHorizontalLayoutLeft flexCenter
			xml.@dominotype="paragraph";
           // CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);

			///TODO: Adjust for Visual Editor
            //xml["@class"] = _cssClass;

            var elementCount:int = component["numElements"];
			if(this.hidewhenFormula){
				xml.@hidewhen=this.hidewhenFormula;
			}
			
            for(var i:int = 0; i < elementCount; i++)
            {
                var element:IComponent = component["getElementAt"](i) as IComponent;
                var exml:XML=element.toCode();
				var hidewhen:String=exml.@hidewhen;
				//Alert.show("exml:"+exml.toXMLString());
				if(exml.name()=="par"){
					exml=exml.children()[0]
				}
				if(hidewhen){
					if(this.hidewhenFormula==null || this.hidewhenFormula.length==0){
							xml.@hidewhen=hidewhen;
					}
				
				}
				xml.appendChild(exml);
            }
		

            return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}

		//fix predef format for center

		private function fixPerdef(xml:XML):XML {


			return xml;
		}

		private static function base64Decode(str:String, charset:String = "UTF-8"):String{
			if((str==null)){
				return "";
			}
			var base64:Base64Decoder = new Base64Decoder();
			base64.decode(str);
			var byteArray:ByteArray = base64.toByteArray();
			return byteArray.readMultiByte(byteArray.length, charset);;
		}

	}
}