////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2016-present Prominic.NET, Inc.
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
	import components.DominoConponentHideBase;

	import flash.utils.ByteArray;

	import global.domino.DominoGlobals;

	import interfaces.IComponent;
	import interfaces.IComponentData;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.components.IDominoParagraph;

	import mx.utils.Base64Decoder;

	import utils.CodeMxmlUtils;



	/**
	 *  <p>Representation and converter from paragraph element  </p>
	 * 
	 *  <p>This class work for  convert from paragraph element of Visuale label/text/field  components  to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoParagraph</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *  &lt;par def=&quot;1019&quot; paragraph=&quot;true&quot; dominotype=&quot;paragraph&quot; class=&quot;flexHorizontalLayout flexHorizontalLayoutLeft flexHorizontalLayoutTop&quot;/&gt;
	 * </pre> 
	 *
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_PARAGRAPH_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoParagraph.as
	 */


	public class DominoParagraph extends DominoConponentHideBase implements IDominoParagraph, IRoyaleComponentConverter,IComponentData
	{
		public static const ROYALE_XML_HORIZONTAL_ELEMENT:String = "HGroup";
		public static const ROYALE_XML_VERTICAL_ELEMENT:String = "VGroup";
		public static const DOMINO_ELEMENT_NAME:String = "par";
		public static var ELEMENT_NAME:String = "Paragraph";

		private static function base64Decode(str:String, charset:String = "UTF-8"):String
		{
			if ((str == null))
			{
				return "";
			}
			var base64:Base64Decoder = new Base64Decoder();
			base64.decode(str);
			var byteArray:ByteArray = base64.toByteArray();
			return byteArray.readMultiByte(byteArray.length, charset);

		}

		public function DominoParagraph(component:IComponent = null)
		{
			super();

			this._component = component;
		}


		private var _leftmargin:String;
		public function get leftmargin():String{
			return _leftmargin;
		}
        public function set leftmargin(value:String):void
		{
			_leftmargin = value;
		}

		private var _firstlineleftmargin:String;
		public function get firstlineleftmargin():String
		{
			return _firstlineleftmargin;
		}
        public function set firstlineleftmargin(value:String):void
		{
			 _firstlineleftmargin= value;
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

		private var _wrap:Boolean;
		public function get wrap():Boolean
		{
			return _wrap;
		}

		public function set wrap(value:Boolean):void
		{
			_wrap = value;
		}

		//for git issue 1033- replace the break label to paragraph
		private var _isNewLine:String;

		public function get isNewLine():String
		{
			return _isNewLine;
		}

		public function set isNewLine(value:String):void
		{
			_isNewLine = value;
		}

		private var _component:IComponent;

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function getComponentData():Object
		{
			var fields:Array = [];
			var dataOutput:Object = {};

			var elementCount:int = component["numElements"];
			for (var i:int = 0; i < elementCount; i++)
			{
				var element:IComponentData = component["getElementAt"](i) as IComponentData;
				if (element == null)
				{
					continue;
				}

				var componentData:Object = element.getComponentData();
				fields.push(componentData);
			}

			if (fields.length > 0)
			{
				dataOutput.fields = fields;
			}

			return dataOutput;
		}


		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			var localSurface:ISurface = surface;

			this._xml = xml;

			setComponentSize(xml);

			this.wrap = true;
			if (xml.@["class"])
			{
				this._cssClass = xml.@["class"];
			}
			if (xml.@["hidewhen"])
			{
				this.hidewhenFormula = base64Decode(xml.@["hidewhen"]);
			}

			if (xml.@["hide"]){
				this.hide = xml.@["hide"];
			}

			if(xml.@["isNewLine"]){
				this.isNewLine = xml.@["isNewLine"];
			}else{
				this.isNewLine = "false";
			}

			if(xml.@["leftmargin"]){
				this.leftmargin = xml.@["leftmargin"]
			}

			if(xml.@["firstlineleftmargin"]){
				this.firstlineleftmargin = xml.@["firstlineleftmargin"]
			}



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
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + " def=\"" + DominoGlobals.PardefDivId + "\"  paragraph=\"true\" />");
			//flexHorizontalLayoutRight flexHorizontalLayoutLeft flexCenter
			xml.@dominotype = "paragraph";

			///TODO: Adjust for Visual Editor
			//xml["@class"] = _cssClass;

			var elementCount:int = component["numElements"];
			if (this.hidewhenFormula)
			{
				xml.@hidewhen = this.hidewhenFormula;
			}

			if (this.hide)
			{
				xml.@hide = this.hide;
			}

			if (this.isNewLine == "true")
			{
				var blankRunXml:XML = new XML("<run isNewLine=\"true\"></run>");
				var blankFontXml:XML = new XML("<font color=\"system\" size=\"12pt\" style=\"normal\"/>");
				blankRunXml.appendChild(blankFontXml);
				blankRunXml.appendChild(new XML("     "));
				xml.appendChild(blankRunXml);
				xml.@isNewLine = "true";
			}

			if(this.leftmargin){
				xml.@leftmargin = this.leftmargin;
			}

			if(this.firstlineleftmargin){
				xml.@firstlineleftmargin = this.firstlineleftmargin;
			}

			for (var i:int = 0; i < elementCount; i++)
			{
				var element:IComponent = component["getElementAt"](i) as IComponent;
				var exml:XML = element.toCode();
				var hidewhen:String = exml.@hidewhen;
				var hide:String = exml.@hide;
				var alignPardef:String = exml.@alignPardef;
				var listPardef:String = exml.@listPardef;
				var outdent:String = exml.@outdent;
				var indent:String = exml.@indent;
				var spacingAbove:String = exml.@spacingAbove;
				var spacingInterline:String = exml.@spacingInterline;
				var spacingBelow:String = exml.@spacingBelow;

				if(outdent){
					xml.@outdent = outdent;
				}

				if(indent){
					xml.@indent = indent;
				}
				if(spacingInterline){
					xml.@spacingInterline = spacingInterline;
				}

				if(spacingBelow){
					xml.@spacingBelow = spacingBelow;
				}

				if(spacingAbove){
					xml.@spacingAbove = spacingAbove;
				}
				
				if (exml.name() == "par")
				{
					exml = exml.children()[0]
				}
				if (hidewhen)
				{
					if (this.hidewhenFormula == null || this.hidewhenFormula.length == 0)
					{
						xml.@hidewhen = hidewhen;
					}

				}

				if(hide)
				{
					xml.@hide = hide;
				}

				if(alignPardef){
					xml.@alignPardef = alignPardef;
				}

				if(listPardef){
					xml.@listPardef = listPardef;
				}
				xml.appendChild(exml);
			}



			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var htmlNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");

			var paragraphXML:XML = new XML("<" + ROYALE_XML_HORIZONTAL_ELEMENT + "/>");
			if (cssClass.indexOf("flexVerticalLayout") > -1)
			{
				paragraphXML = new XML("<" + ROYALE_XML_VERTICAL_ELEMENT + "/>");
			}
			paragraphXML.setNamespace(htmlNamespace);
			CodeMxmlUtils.setMXMLComponentSize(this, paragraphXML);

			var elementCount:int = component["numElements"];
			for (var i:int = 0; i < elementCount; i++)
			{
				var element:IRoyaleComponentConverter = component["getElementAt"](i);
				if (element == null)
				{
					continue;
				}

				var elementXML:XML = element.toRoyaleConvertCode();

				paragraphXML.appendChild(elementXML);
			}

			return paragraphXML;
		}
	}
}