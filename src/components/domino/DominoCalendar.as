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

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.components.ICalendar;


	/**
	 *  <p>Representation and converter for Visuale calandar UI component</p>
	 * 
	 *  <p>his class work for  convert from Visuale main calandar components to target framework of body format</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoCalendar</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 &lt;Calendar date=&quot;yearmonthday&quot; dateformat=&quot;weekdaymonthdayyear&quot;
	 *					dateseparator1=&quot; &quot; dateseparator2=&quot;/&quot; dateseparator3=&quot;/&quot;
	 *					dayformat=&quot;twodigitday&quot; fourdigityearfor21stcentury=&quot;true&quot; height=&quot;30&quot;
	 *					mode=&quot;popup&quot; monthformat=&quot;twodigitmonth&quot; pattern=&quot;MM/dd/yyyy&quot; preference=&quot;usersetting&quot;
	 *					show=&quot;datetime&quot; time=&quot;hourminute&quot; timeseparator=&quot;:&quot; value=&quot;StartDate&quot; weekdayformat=&quot;shortname&quot;
	 *					width=&quot;100&quot; yearformat=&quot;fourdigityear&quot; zone=&quot;never&quot;/&gt;
     * </pre>
	 * 
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoCalendar.as
	 */

	
	public class DominoCalendar extends ComponentBase implements ICalendar, IRoyaleComponentConverter
	{
		public static const ROYALE_DATEFIELD_ELEMENT_NAME:String = "DateField";
		public static const ROYALE_DATECHOOSER_ELEMENT_NAME:String = "DateChooser";
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "Calendar";
		public static const ELEMENT_NAME:String = "Calendar";

		public function DominoCalendar()
		{
			super();
		}

		private var _width:Number;

		override public function get width():Number
		{
			return _width;
		}

		override public function set width(value:Number):void
		{
			_width = value;
		}

		private var _height:Number;

		override public function get height():Number
		{
			return _height;
		}

		override public function set height(value:Number):void
		{
			_height = value;
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

		private var _date:String;

		public function get date():String
		{
			return _date;
		}

		public function set date(value:String):void
		{
			_date = value;
		}

		private var _dateformat:String;

		public function get dateformat():String
		{
			return _dateformat;
		}

		public function set dateformat(value:String):void
		{
			_dateformat = value;
		}
		//
		private var _dateseparator1:String;

		public function get dateseparator1():String
		{
			return _dateseparator1;
		}

		public function set dateseparator1(value:String):void
		{
			_dateseparator1 = value;
		}

		//dateseparator2
		private var _dateseparator2:String;

		public function get dateseparator2():String
		{
			return _dateseparator2;
		}

		public function set dateseparator2(value:String):void
		{
			_dateseparator2 = value;
		}

		//dateseparator3
		private var _dateseparator3:String;

		public function get dateseparator3():String
		{
			return _dateseparator3;
		}

		public function set dateseparator3(value:String):void
		{
			_dateseparator3 = value;
		}

		//dayformat
		private var _dayformat:String;

		public function get dayformat():String
		{
			return _dayformat;
		}

		public function set dayformat(value:String):void
		{
			_dayformat = value;
		}

		//fourdigityearfor21stcentury
		private var _fourdigityearfor21stcentury:String;

		public function get fourdigityearfor21stcentury():String
		{
			return _fourdigityearfor21stcentury;
		}

		public function set fourdigityearfor21stcentury(value:String):void
		{
			_fourdigityearfor21stcentury = value;
		}

		//pattern

		//mode
		private var _mode:String;

		public function get mode():String
		{
			return _mode;
		}

		public function set mode(value:String):void
		{
			_mode = value;
		}

		//monthformat
		private var _monthformat:String;

		public function get monthformat():String
		{
			return _monthformat;
		}

		public function set monthformat(value:String):void
		{
			_monthformat = value;
		}

		//preference
		private var _preference:String;

		public function get preference():String
		{
			return _preference;
		}

		public function set preference(value:String):void
		{
			_preference = value;
		}

		//show
		private var _show:String;

		public function get show():String
		{
			return _show;
		}

		public function set show(value:String):void
		{
			_show = value;
		}

		//time
		private var _time:String;

		public function get time():String
		{
			return _time;
		}

		public function set time(value:String):void
		{
			_time = value;
		}

		//timeseparator
		private var _timeseparator:String;

		public function get timeseparator():String
		{
			return _timeseparator;
		}

		public function set timeseparator(value:String):void
		{
			_timeseparator = value;
		}

		//value
		private var _calendarValue:String;

		public function get calendarValue():String
		{
			return _calendarValue;
		}

		public function set calendarValue(value:String):void
		{
			_calendarValue = value;
		}

		//weekdayformat
		private var _weekdayformat:String;

		public function get weekdayformat():String
		{
			return _weekdayformat;
		}

		public function set weekdayformat(value:String):void
		{
			_weekdayformat = value;
		}

		//yearformat
		private var _yearformat:String;
		public function get yearformat():String
		{
			return _yearformat;
		}

		public function set yearformat(value:String):void
		{
			_yearformat = value;
		}

		//zone
		private var _zone:String;
		public function get zone():String
		{
			return _zone;
		}

		public function set zone(value:String):void
		{
			_zone = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			setComponentSize(xml);

			this.pattern = xml.@pattern ? xml.@pattern : this.pattern;

			this.selectedDate = xml.@selectedDate;
			this.mode = xml.@mode;

			this.minDate = xml.@minDate;
			this.maxDate = xml.@maxDate;
			this.yearformat = xml.@yearformat;
			this.calendarValue = xml.@value;
			this.weekdayformat = xml.@weekdayformat;
			this.timeseparator = xml.@timeseparator;
			this.time = xml.@time;
			this.show = xml.@show;
			this.preference = xml.@preference;
			this.pattern = xml.@pattern;
			this.monthformat = xml.@monthformat;

			if (xml.@height)
			{
				this.height = Number(xml.@height)
			}

			this.fourdigityearfor21stcentury = xml.@fourdigityearfor21stcentury;
			this.dayformat = xml.@dayformat;
			this.dateseparator3 = xml.@dateseparator3;
			this.dateseparator2 = xml.@dateseparator2;
			this.dateseparator1 = xml.@dateseparator1;
			this.dateformat = xml.@dateformat;
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<ELEMENT_NAME/>");
			if (this.selectedDate)
			{
				xml.@selectedDate = this.selectedDate;
			}

			if (this.pattern)
			{
				xml.@pattern = this.pattern;
			}

			if (this.mode)
			{
				xml.@mode = this.mode;
			}
			if (this.minDate)
			{
				xml.@minDate = this.minDate;
			}

			if (this.maxDate)
			{
				xml.@maxDate = this.maxDate;
			}
			if (this.yearformat)
			{
				xml.@yearformat = this.yearformat;
			}
			if (this.calendarValue)
			{
				xml.@value = this.calendarValue;
			}
			if (this.width)
			{
				xml.@width = this.width.toString();
			}
			if (this.weekdayformat)
			{
				xml.@weekdayformat = this.weekdayformat;
			}
			if (this.timeseparator)
			{
				xml.@timeseparator = this.timeseparator;
			}
			if (this.time)
			{
				xml.@time = this.time;
			}
			if (this.show)
			{
				xml.@show = this.show;
			}
			if (this.preference)
			{
				xml.@preference = this.preference;
			}

			if (this.pattern)
			{
				xml.@pattern = this.pattern;
			}

			if (this.monthformat)
			{
				xml.@monthformat = this.monthformat;
			}
			if (this.height)
			{
				xml.@height = this.height.toString();
			}
			if (this.fourdigityearfor21stcentury)
			{
				xml.@fourdigityearfor21stcentury = this.fourdigityearfor21stcentury;
			}

			if (this.dayformat)
			{
				xml.@dayformat = this.dayformat;
			}

			if (this.dateseparator3)
			{
				xml.@dateseparator3 = this.dateseparator3;
			}

			if (this.dateseparator2)
			{
				xml.@dateseparator2 = this.dateseparator2;
			}
			if (this.dateseparator1)
			{
				xml.@dateseparator1 = this.dateseparator1;
			}
			if (this.dateformat)
			{
				xml.@dateformat = this.dateformat;
			}

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var componentXML:XML = new XML("<" + ROYALE_DATEFIELD_ELEMENT_NAME + ">" + "</" + ROYALE_DATEFIELD_ELEMENT_NAME + ">");

			if (this.mode == "inline")
			{
				componentXML = new XML("<" + ROYALE_DATECHOOSER_ELEMENT_NAME + ">" + "</" + ROYALE_DATECHOOSER_ELEMENT_NAME + ">");
			}

			componentXML.@dateFormat = "MM/DD/YYYY";

			var royaleNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			componentXML.addNamespace(royaleNamespace);
			componentXML.setNamespace(royaleNamespace);

			return componentXML;
		}
	}
}