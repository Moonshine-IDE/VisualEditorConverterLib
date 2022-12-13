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

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoSubForm;
	import com.adobe.utils.StringUtil;
	import global.domino.DominoGlobals;
    import utils.CodeMxmlUtils;
    import interfaces.IComponent;
    import interfaces.dominoComponents.IDominoShareActions;
	import view.EditingSurface;

    public class DominoShareActions extends DominoConponentHideBase implements IDominoShareActions, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "sharedactions";
		public static const ELEMENT_NAME:String = "Sharedactions";
		public var editingSurface:EditingSurface;
		
		
		public function DominoShareActions(component:IComponent = null)
		{
			super();
            this._component = component;
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

		private var _name:String;
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

        private var _alias:String;
		public function get alias():String
		{
			return _alias;
		}

		public function set alias(value:String):void
		{
			_alias = value;
		}


        private var _comment:String;
		public function get comment():String
		{
			return _comment;
		}

		public function set comment(value:String):void
		{
			_comment = value;
		}



		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			
			if (xml.@name)
			{
				this.name = xml.@name;
			}


            if(xml.@alias){
                this.alias = xml.@alias;
            }

            if(xml.@comment){
                this.comment = xml.@comment;
            }
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

			if (this.name)
			{
				xml.@name = this.name;
			}

            if(this.alias)
            {
                xml.@alias = this.alias;
            }

            if(this.comment)
            {
                xml.@comment = this.comment;
            }
			delete xml["@class"];

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return null;

		}
    }
}