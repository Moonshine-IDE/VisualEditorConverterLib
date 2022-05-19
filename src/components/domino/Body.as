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
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoBody;

	import utils.CodeMxmlUtils;

	import utils.CodeXMLUtils;

	import flash.utils.getQualifiedClassName;

	import global.domino.DominoGlobals;

	import mx.controls.Alert;

	/**
	 *  <p>Representation and converter for Domino Body</p>
	 * 
	 *  <p>This class work for  convert from Visuale main container components to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  Visuale UI main container component from Visual Editor</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *  &lt;item name=&quot;$Body&quot; sign=&quot;true&quot;&gt;&lt;richtext&gt;&lt;/richtext&gt;&lt;/item&gt;
     * </pre>
	 * 
	 * <p> Example Royale output:</p>
	 * <pre>
	 * &lt;j:ApplicationMainContent&gt;&lt;j:ScrollableSectionConten&gt;&lt;/j:ScrollableSectionConten&gt;&lt;/j:ApplicationMainContent&gt;
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_BODY_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/Body.as
	 */
	public class Body extends ComponentBase implements IDominoBody, IRoyaleComponentConverter
	{
		private static const DOMINO_ELEMENT_NAME:String = "body";
		public static var ELEMENT_NAME:String = "Body";

		public function Body(component:IComponent = null)
		{
			super();

			this._component = component;
		}
		private var _xml:XML;

		private var _isSelected:Boolean;

		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		private var _component:IComponent;

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			var localSurface:ISurface = surface;

			this._xml = xml;

			setComponentSize(xml);

			var elementsXML:XMLList = xml.elements();
			var childCount:int = elementsXML.length();
			for (var i:int = 0; i < childCount; i++)
			{
				var childXML:XML = elementsXML[i];
				childFromXMLCallback(component, lookup, childXML, localSurface);
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
			CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);
			var elementCount:int = component["numElements"];
			var element:IComponent = null;
			for (var i:int = 0; i < elementCount; i++)
			{
				DominoGlobals.PardefDivId++;
				element = component["getElementAt"](i) as IComponent;
				
				var className:String=getQualifiedClassName(element);

				//Alert.show("className:"+className);
             
				if(className=="components.domino::DominoParagraph"){
					
					xml.appendChild(toPerDefCode(element.toCode()));
				}

				if(className=="components.domino::DominoLabel" || 
				className=="components.domino::DominoInputText" ||
				className=="components.domino::DominoButton" ||
				className=="components.domino::DominoComputedText" ||
				className=="components.domino::DominoSection" ||
				className=="components.domino::DominoTable"||
				className=="components.domino::DominoTabView"){
					xml.appendChild(toHidePerDefCode(element.toCode()));
					
				}
				
				xml.appendChild(element.toCode());
			}
			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var mainContainer:XML = new XML("<VGroup></VGroup>");

			var direction:String = _xml.@direction;
			if (direction == "Horizontal")
			{
				mainContainer = new XML("<HGroup></HGroup>");
				mainContainer.@itemsHorizontalAlign = getAlignmentHorizontal();
			}
			else
			{
				mainContainer.@itemsVerticalAlign = getAlignmentVertical();
			}
			var jNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			mainContainer.addNamespace(jNamespace);
			mainContainer.setNamespace(jNamespace);

			var mxmlNamespace:Namespace = new Namespace("fx", "http://ns.adobe.com/mxml/2009");
			mainContainer.addNamespace(mxmlNamespace);

			var jsNamespace:Namespace = new Namespace("js", "library://ns.apache.org/royale/basic");
			mainContainer.addNamespace(jsNamespace);

			var htmlNamespace:Namespace = new Namespace("html", "library://ns.apache.org/royale/html");
			mainContainer.addNamespace(htmlNamespace);

			var joditEditor:Namespace = new Namespace("joditeditor", "classes.joditeditor.*");
			mainContainer.addNamespace(joditEditor);

			return mainContainer;
		}

		private function getAlignmentHorizontal():String
		{
			var alignment:String = String(_xml["@class"]);

			var findAlignmentIndex:int = alignment.lastIndexOf("flexHorizontalLayoutRight");
			if (findAlignmentIndex > -1)
			{
				return "itemsRight";
			}

			findAlignmentIndex = alignment.lastIndexOf("flexCenter");
			if (findAlignmentIndex > -1)
			{
				return "itemsCenter";
			}

			return "itemsLeft";
		}

		private function getAlignmentVertical():String
		{
			var alignment:String = String(_xml["@class"]);

			var findAlignmentIndex:int = alignment.lastIndexOf("itemsTop");
			if (findAlignmentIndex > -1)
			{
				return "itemsBottom";
			}

			findAlignmentIndex = alignment.lastIndexOf("flexCenter");
			if (findAlignmentIndex > -1)
			{
				return "itemsCenter";
			}

			return "itemsTop";
		}

		public function toHidePerDefCode( xml:XML):XML
		{
			if(xml!=null){
				var pardefXml:XML = new XML("<pardef id=\""+DominoGlobals.PardefDivId+"\" "+" dominotype=\"domino\" keeptogether=\"true\" keepwithnext=\"true\"/>" );
				if(xml.@hide&& xml.@hide!=""){
					pardefXml.@hide=xml.@hide;
					xml.@def=DominoGlobals.PardefDivId;
					//arond a new par for the traget element 
					
				}
			}

			return pardefXml;
		}

		private function toPerDefCode( xml:XML):XML
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
	}
}