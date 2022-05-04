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

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.components.ICalendar;

	/**
	 * This class work for  convert from Visuale main calandar components to target framework of body format.
	 * Call different methods to convert the component to different target formats.
	 * For now:
	 * toCode() will convert the Visuale main container calandar to domino calandar  dxl format.
	 * toRoyaleConvertCode() will  convert the Visuale main container components to Rayale button format.
	 * For Test Input&Output:
	 * Input : - [Visuale UI main calandar component](https://github.com/Moonshine-IDE/MockupVisualEditor/blob/features/issue_675_royale_generate_domino_visual_editor/src/view/domino/surfaceComponents/components/DominoCalendar.as)
	 * Output example:  Domino - <Calendar date="yearmonthday" dateformat="weekdaymonthdayyear"
	 *					dateseparator1=" " dateseparator2="/" dateseparator3="/"
	 *					dayformat="twodigitday" fourdigityearfor21stcentury="true" height="30"
	 *					mode="popup" monthformat="twodigitmonth" pattern="MM/dd/yyyy" preference="usersetting"
	 *					show="datetime" time="hourminute" timeseparator=":" value="StartDate" weekdayformat="shortname"
	 *					width="100" yearformat="fourdigityear" zone="never"/>
	 *					Royale - TODO
	 *
	 * {@link #components.domino}
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
			if (xml.@width)
			{
				this.width = Number(xml.@width);
			}

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