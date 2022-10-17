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
	import interfaces.components.ICalendar;
	import utils.CodeXMLUtils;
	import utils.CodeMxmlUtils;

	public class Calendar extends ComponentBase implements ICalendar
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "calendar";
        public static const ELEMENT_NAME:String = "Calendar";

		public function Calendar()
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
		
		private var _pattern:String = "MM/dd/yyyy";
		public function get pattern():String
		{
			return _pattern;
		}

		public function set pattern(value:String):void
		{
			_pattern = value;
		}
		
		private var _selectedDate:String;
		public function get selectedDate():String
		{
			return _selectedDate;
		}

		public function set selectedDate(value:String):void
		{
			_selectedDate = value;
		}
		
		private var _minDate:String;
		public function get minDate():String
		{
			return _minDate;
		}

		public function set minDate(value:String):void
		{
			_minDate = value;
		}
		
		private var _maxDate:String;
		public function get maxDate():String
		{
			return _maxDate;
		}

		public function set maxDate(value:String):void
		{
			_maxDate = value;
		}
		
		private var _mode:String;
		public function get mode():String
		{
			return _mode;
		}

		public function set mode(value:String):void
		{
			_mode = value;
		}
		
		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			setComponentSize(xml);
			
			this.pattern = xml.@pattern ? xml.@pattern : this.pattern;

            this.selectedDate = xml.@selectedDate;
            this.mode = xml.@mode;

            this.minDate = xml.@minDate;
            this.maxDate = xml.@maxDate;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

            xml.@mode = this.mode;
            xml.@pattern = this.pattern;

            if (this.minDate)
            {
                xml.@minDate = this.minDate;
            }

            if (this.maxDate)
            {
                xml.@maxDate = this.maxDate;
            }

            if (this.selectedDate)
            {
                xml.@value = this.selectedDate;
            }

            return xml;
		}
	}
}