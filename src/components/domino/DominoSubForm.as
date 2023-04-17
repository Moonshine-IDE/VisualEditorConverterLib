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
	import components.DominoConponentHideBase;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoSubForm;
	import com.adobe.utils.StringUtil;
	import global.domino.DominoGlobals;
    import utils.CodeMxmlUtils;
    import interfaces.IComponent;

    public class DominoSubForm extends DominoConponentHideBase implements IDominoSubForm, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "subformref";
		public static const ELEMENT_NAME:String = "Subformref";
        public function DominoSubForm(component:IComponent = null)
		{
			super();
            this._component = component;
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

		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
        private var _component:IComponent;

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		private var _subFormName:String;
		public function get subFormName():String
		{
			return _subFormName;
		}

		public function set subFormName(value:String):void
		{
			_subFormName = value;
		}

		private var _subFormFormula:String;
		public function get subFormFormula():String
		{
			return _subFormFormula;
		}

		public function set subFormFormula(value:String):void
		{
			_subFormFormula = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			
			if (xml.@subFormName)
			{
				this.subFormName = xml.@subFormName;
			}

			//some times , the subfrom name defined in the formual , so we need handle it in here
            var children:XMLList = xml.children();
            if ( children.length() > 0 ) {
                 for (var i:int = 0; i < children.length(); i++)
				{
					 if(children[i].name()=="code"){
						
							var childrenFormula:XMLList = children[i].children();
							for (var j:int = 0; j < children.length(); j++){
								if(childrenFormula[j]!=null){
									if(childrenFormula[j].name()=="formula"){
										this.subFormFormula=childrenFormula[j].text();
									}
								}
							}
						
						
                    }
				}
				
				
            }


		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

			if (this.subFormName)
			{
				xml.@name = this.subFormName;
			}
			delete xml["@class"];

			if(this.subFormFormula)
			{
				var codexml:XML = new XML("<code event=\"value\"/>");
				var formulaxml:XML = new XML("<formula>"+this.subFormFormula+"</formula>");
				codexml.appendChild(formulaxml);
				xml.appendChild(codexml);
			}

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var subformNameViews:String = this.subFormName + "Views";
			var htmlNamespace:Namespace = new Namespace(subformNameViews, "$ProjectName.views.modules.subforms." + this.subFormName + "." + subformNameViews + ".*");
			var subFormXML:XML = new XML("<" + this.subFormName + "/>");
			subFormXML.setNamespace(htmlNamespace);

			subFormXML.@itemVO = "{itemVO}";
			subFormXML.@isDisabled = "{isDisabled}";

			return subFormXML;
		}
    }
}