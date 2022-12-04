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
	import components.DominoConponentHideBase;

	import global.domino.DominoGlobals;

	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoSection;
	import global.domino.DominoGlobals;

	/**
	 *  <p>Representation and converter from  Visuale section  components   </p>
	 * 
	 *  <p>This class work for  convert from Visuale section  components  to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoSection</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 * &lt;section expanded=&quot;false&quot; showastext=&quot;false&quot;&gt;
	 *    &lt;sectiontitle color=&quot;system&quot;&gt;
	 *      &lt;font size=&quot;12pt&quot; style=&quot;normal&quot;/&gt;&lt;text&gt;Default Title&lt;/text&gt;
	 *    &lt;/sectiontitle&gt;
	 * &lt;/section&gt;
	 * </pre> 
	 *
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_SECTION_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoSection.as
	 */

	public class DominoSection extends DominoConponentHideBase implements IDominoSection, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "section";
		public static const ELEMENT_NAME:String = "Section";

		public function DominoSection(component:IComponent = null)
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

		//------------comenent start------------------
		private var _title:String;

		public function get title():String
		{
			return _title;
		}

		public function set title(t:String):void
		{
			_title = t;
		}

		private var _titleColor:String;

		public function get titleColor():String
		{
			return _titleColor;
		}

		public function set titleColor(t:String):void
		{
			_titleColor = t;
		}

		private var _titleFontStyle:String;

		public function get titleFontStyle():String
		{
			return _titleFontStyle;
		}

		public function set titleFontStyle(t:String):void
		{
			_titleFontStyle = t;
		}

		private var _titleSize:String;

		public function get titleSize():String
		{
			return _titleSize;
		}

		public function set titleSize(t:String):void
		{
			_titleSize = t;
		}

		private var _onread:String;

		//onread,onedit,onpreview,onprint,expanded,
		//showastext,accessfieldkind,accessfieldname

		public function get onread():String
		{
			return _onread;
		}

		public function set onread(t:String):void
		{
			_onread = t;
		}

		private var _onedit:String;

		public function get onedit():String
		{
			return _onedit;
		}

		public function set onedit(t:String):void
		{
			_onedit = t;
		}

		private var _onpreview:String;

		public function get onpreview():String
		{
			return _onpreview;
		}

		public function set onpreview(t:String):void
		{
			_onpreview = t;
		}

		private var _onprint:String;

		public function get onprint():String
		{
			return _onprint;
		}

		public function set onprint(t:String):void
		{
			_onprint = t;
		}

		private var _expanded:Boolean;

		public function get expanded():Boolean
		{
			return _expanded;
		}

		public function set expanded(t:Boolean):void
		{
			_expanded = t;
		}

		private var _showastext:Boolean;

		public function get showastext():Boolean
		{
			return _showastext;
		}

		public function set showastext(t:Boolean):void
		{
			_showastext = t;
		}

		private var _accessfieldkind:String;

		public function get accessfieldkind():String
		{
			return _accessfieldkind;
		}

		public function set accessfieldkind(t:String):void
		{
			_accessfieldkind = t;
		}

		private var _accessfieldname:String;

		public function get accessfieldname():String
		{
			return _accessfieldname;
		}

		public function set accessfieldname(t:String):void
		{
			_accessfieldname = t;
		}

		private var _component:IComponent;

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface,  lookup:ILookup):void
		{
			var localSurface:ISurface = surface;

			this.setComponentSize(xml);
			this.title = xml.@title;
			this.titleColor = xml.@titleColor;
			this.titleFontStyle = xml.@titleFontStyle;
			this.titleSize = xml.@titleSize;

			//onread,onedit,onpreview,onprint,expanded,
			//showastext,accessfieldkind,accessfieldname
			this.onread = xml.@onread;
			this.onedit = xml.@onedit;
			this.onpreview = xml.@onpreview;
			this.onprint = xml.@onprint;
			this.expanded = xml.@expanded == "true";
			this.showastext = xml.@showastext == "true";
			this.accessfieldkind = xml.@accessfieldkind;
			this.accessfieldname = xml.@accessfieldname;
			this.hide = xml.@hide;


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

			var par_xml:XML;
			
			//for domino input field element must contain into par node
			//var code_string:String=fixSpecailCharacter(this.text)
			var section_xml:XML = new XML("<section/>");
			//onread,onedit,onpreview,onprint,expanded,
			//showastext,accessfieldkind,accessfieldname
			if (this.onread)
			{
				section_xml.@onread = this.onread
			}
			if (this.onedit)
			{
				section_xml.@onedit = this.onedit
			}

			if (this.hide)
			{
				section_xml.@hide = this.hide
			}

			

			if (this.onpreview)
			{
				section_xml.@onpreview = this.onpreview
			}
			if (this.expanded)
			{
				section_xml.@expanded = this.expanded
			} else
			{
				section_xml.@expanded = false
			}
			if (this.showastext)
			{
				section_xml.@showastext = this.showastext
			} else
			{
				section_xml.@showastext = false
			}

			if (this.accessfieldkind)
			{
				section_xml.@accessfieldkind = this.accessfieldkind
			}
			if (this.accessfieldname)
			{
				section_xml.@accessfieldname = this.accessfieldname
			}

			if (!this.titleSize)
			{
				//this.titleSize="12pt";
			}
			if (!this.titleColor)
			{
				this.titleColor = "system"
			}

			if (!this.titleFontStyle)
			{
				this.titleFontStyle = "normal"
			}

			if (!this.title)
			{
				this.title = "Default Title"
			}
			if (this.titleSize)
			{
				if (this.titleSize.substring(this.titleSize.length - 2) != "pt")
				{
					this.titleSize = this.titleSize + "pt"
				}
			}


			

			var section_title_xml_str:String = "";
			if (this.titleSize)
			{
				section_title_xml_str = "<sectiontitle>" + "<font size=\"" + this.titleSize + "\" ";
			} else
			{
				section_title_xml_str = "<sectiontitle>" + "<font  ";
			}

			


			section_title_xml_str = section_title_xml_str + "  style=\"" + this.titleFontStyle + "\" />" + "<text>" + this.title + "</text></sectiontitle>";


			var section_title_xml:XML = new XML(section_title_xml_str);
			if(this.hide){
				section_title_xml.@pardef=DominoGlobals.PardefDivId;
			}
			
			// section_title_xml.appendChild(section_title_text_str);
			if (this.titleColor)
			{
				section_title_xml.@color = this.titleColor;
			}

			section_xml.appendChild(section_title_xml)

			var elementCount:int = component["numElements"];
			for (var i:int = 0; i < elementCount; i++)
			{
				var element:Object = component["getElementAt"](i);
				if (element)
				{
					
					var exml:XML = element.toCode();
				
					if (exml)
					{
						
						if (exml.name() == "par")
						{
							if (exml.@hidewhen && exml.@hidewhen.length() > 0)
							{
								//we need add pardef for hidewhen formuala
								DominoGlobals.PardefId++;
								var pardeXml:XML = new XML("<pardef id=\"" + DominoGlobals.PardefId + "\"  dominotype=\"dominosection\"/>");
								var code_xml:XML = new XML("<code event=\"hidewhen\" />");
								var formula_xml:XML = new XML("<formula>" + exml.@hidewhen + "</formula>");
								code_xml.appendChild(formula_xml);
								pardeXml.appendChild(code_xml);
								section_xml.appendChild(pardeXml);
								exml.@def = DominoGlobals.PardefId;

							}
							if (exml.@dominotype == "computedtext")
							{

							} else
							{
								//	exml=exml.children()[0]
								// var exmlNumElements:int = exml["numElements"];
								// if(exmlNumElements>0){
								// 		for (var exmlCount:int = 0; exmlCount < exmlNumElements; exmlCount++){
								// 				var exmlChildElement:Object = exml["getElementAt"](exmlCount);
								// 				//we should check the empty par tag in here
								// 				var exmlChildXml:XML=exmlChildElement.toCode();
								// 				exml.appendChild(exmlChildXml);
								// 		}
							
								// }
							}

							

						}

						if (exml.name() == "run")
						{
							var par_xml_run:XML = new XML("<par/>");
							exml = par_xml_run.appendChild(exml);
						}

						section_xml.appendChild(exml);
					}
				}
			}

			
			

			return section_xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var tab_xml:XML = new XML("");
			return tab_xml;

		}
	}
}