////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) STARTcloud, Inc. 2015-2022. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the Server Side Public License, version 1,
//  as published by MongoDB, Inc.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  Server Side Public License for more details.
//
//  You should have received a copy of the Server Side Public License
//  along with this program. If not, see
//
//  http://www.mongodb.com/licensing/server-side-public-license
//
//  As a special exception, the copyright holders give permission to link the
//  code of portions of this program with the OpenSSL library under certain
//  conditions as described in each individual source file and distribute
//  linked combinations including the program with the OpenSSL library. You
//  must comply with the Server Side Public License in all respects for
//  all of the code used other than as permitted herein. If you modify file(s)
//  with this exception, you may extend this exception to your version of the
//  file(s), but you are not obligated to do so. If you do not wish to do so,
//  delete this exception statement from your version. If you delete this
//  exception statement from all source files in the program, then also delete
//  it in the license file.
//
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
			var jNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			var mxmlNamespace:Namespace = new Namespace("fx", "http://ns.adobe.com/mxml/2009");
			var jsNamespace:Namespace = new Namespace("js", "library://ns.apache.org/royale/basic");
			var htmlNamespace:Namespace = new Namespace("html", "library://ns.apache.org/royale/html");
			var joditEditorNamespace:Namespace = new Namespace("joditeditor", "classes.joditeditor.*");
			var dataGridNamespace:Namespace = new Namespace("dataGrid", "classes.dataGrid.*");

			var mainContainer:XML = new XML("<VGroup></VGroup>");
				mainContainer.@currentState = "dataGridState";
				mainContainer.@gap = "5";
				mainContainer.@stateChangeComplete = "{this.dispatchEvent(new Event('valueChange'))}";

			var beadsXML:XML = new XML("<beads />");
				beadsXML.setNamespace(jNamespace);

			mainContainer.appendChild(beadsXML);

			var dataBindingXML:XML = new XML("<ContainerDataBinding />");
				dataBindingXML.setNamespace(jsNamespace);
				beadsXML.appendChild(dataBindingXML);

			var statesBeadXML:XML = new XML("<SimpleStatesImpl />");
				statesBeadXML.setNamespace(jsNamespace);
				beadsXML.appendChild(statesBeadXML);

			var statesXML:XML = new XML("<states />");
				statesXML.setNamespace(jNamespace);
			var stateXML:XML = new XML("<State />");
				stateXML.@name = "dataGridState";
				stateXML.setNamespace(jsNamespace);
				statesXML.appendChild(stateXML);

				stateXML = new XML("<State />");
				stateXML.@name = "contentState";
				stateXML.setNamespace(jsNamespace);
				statesXML.appendChild(stateXML);

			mainContainer.appendChild(statesXML);

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

			mainContainer.addNamespace(jNamespace);
			mainContainer.setNamespace(jNamespace);
			mainContainer.addNamespace(mxmlNamespace);
			mainContainer.addNamespace(jsNamespace);
			mainContainer.addNamespace(htmlNamespace);
			mainContainer.addNamespace(joditEditorNamespace);
			mainContainer.addNamespace(dataGridNamespace);

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
				var pardefXml:XML = new XML("<pardef id=\""+DominoGlobals.PardefDivId+"\" "+" dominotype=\"dominoHideBody\" keeptogether=\"true\" keepwithnext=\"true\"/>" );
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