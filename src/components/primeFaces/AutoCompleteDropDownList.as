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
package components.primeFaces
{
    import components.ComponentBase;

	import interfaces.ILookup;
	import interfaces.ISurface;
	import interfaces.components.IAutoCompleteDropDownList;
    import utils.CodeMxmlUtils;
    import utils.CodeXMLUtils;

	public class AutoCompleteDropDownList extends ComponentBase implements IAutoCompleteDropDownList
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "autoComplete";
        public static const ELEMENT_NAME:String = "DropDownList";

		public function AutoCompleteDropDownList()
		{
			super();
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
		
		private var _value:String;
		public function get value():String
		{
			return _value;
		}

		public function set value(value:String):void
		{
			_value = value;
		}
		
		private var _fieldVar:String;
		public function get fieldVar():String
		{
			return _fieldVar;
		}

		public function set fieldVar(value:String):void
		{
			_fieldVar = value;
		}
		
		private var _multiple:Boolean;
		public function get multiple():Boolean
		{
			return _multiple;
		}

		public function set multiple(value:Boolean):void
		{
			_multiple = value;
		}
		
		private var _completeMethod:String;
		public function get completeMethod():String
		{
			return _completeMethod;
		}

		public function set completeMethod(value:String):void
		{
			_completeMethod = value;
		}
		
		private var _itemLabel:String;
		public function get itemLabel():String
		{
			return _itemLabel;
		}

		public function set itemLabel(value:String):void
		{
			_itemLabel = value;
		}
		
		private var _itemValue:String;
		public function get itemValue():String
		{
			return _itemValue;
		}

		public function set itemValue(value:String):void
		{
			_itemValue = value;
		}
		
		private var _converter:String;
		public function get converter():String
		{
			return _converter;
		}

		public function set converter(value:String):void
		{
			_converter = value;
		}
		
		private var _isDropDown:Boolean;
		public function get isDropDown():Boolean
		{
			return _isDropDown;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);
			
			this.value = xml.@value;
            this.fieldVar = xml.@['var'];

            this.multiple = xml.@multiple == "true";

			this.completeMethod = xml.@completeMethod;
			this.itemLabel = xml.@itemLabel;
			this.itemValue = xml.@itemValue;
			this.converter = xml.@converter;
			this._isDropDown = true;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            xml.@dropdown = this.isDropDown;
            xml.@multiple = this.multiple;
			
			xml.@value = this.value;
            xml.@['var'] = this.fieldVar;

			if (this.completeMethod)
            {
                xml.@completeMethod = this.completeMethod;
            }

			if (this.itemLabel)
			{
				xml.@itemLabel = this.itemLabel;
            }

			if (this.itemValue)
			{
				xml.@itemValue = this.itemValue;
            }

			if (this.converter)
			{
				xml.@converter = this.converter;
            }

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

            return xml;
		}
	}
}