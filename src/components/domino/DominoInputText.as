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

	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;

	import interfaces.IComponentData;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoInputText;

	import mx.utils.Base64Encoder;
	import utils.StringHelperUtils;

	import utils.CodeMxmlUtils;
	import org.apache.flex.packageflexsdk.util.ApacheURLLoader;
	import components.DominoConponentHideBase;
	import global.domino.DominoGlobals;
	


	/**
	 *  <p>Representation and converter for Visuale field  components </p>
	 * 
	 *  <p> This class work for  convert from Visuale field  components to target framework of domino format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  Partial</li>
	 *  </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoInputText</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *  &lt;field useappletinbrowser=&quot;false&quot; allowtabout=&quot;false&quot; defaultfocus=&quot;false&quot; protected=&quot;false&quot; sign=&quot;false&quot; storelocally=&quot;false&quot; type=&quot;text&quot; kind=&quot;editable&quot; computeaftervalidation=&quot;false&quot; allowmultivalues=&quot;false&quot; width=&quot;100pt&quot; height=&quot;30pt&quot; bgcolor=&quot;#ffffff&quot; name=&quot;test&quot;/&gt;
     * </pre>
	 * <p>Domino event:</p>
	 * <pre>
	 * Client: Default value,Input Translation, Input Validation, Input Enabled,HTML attribute
	 * Web: onBlur,onChange,onClick,onFocus,onKeyDown,onKeyPress,onKeyUp,onMouseDown,onMouseUp,onMouseMove,OnMouseOut,OnMouseOver,onSelect,
	 * Client:(option),(Declarations),Entering,Exiting,Initialize,Terminate
	 * </pre>
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_FIELD_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoInputText.as
	 */

	
	public class DominoInputText extends DominoConponentHideBase implements IDominoInputText, IRoyaleComponentConverter, IComponentData 
	{
		public static const DOMINO_ELEMENT_NAME:String = "field";
		public static const ELEMENT_NAME:String = "Field";
		public static const ROYALE_ELEMENT_NAME_TEXT:String = "TextInput";
		public static const ROYALE_ELEMENT_NAME_DATE:String = "DateField";
		public static const ROYALE_ELEMENT_NAME_CHECKBOX:String = "CheckBox";
		public static const ROYALE_ELEMENT_NAME_JODIT:String = "JoditEditor";

		public static function base64Encode(str:String, charset:String = "UTF-8"):String
		{
			if ((str == null))
			{
				return "";
			}
			var base64:Base64Encoder = new Base64Encoder();
			base64.insertNewLines = false;
			var byte:ByteArray = new ByteArray();
			byte.writeMultiByte(str, charset);
			base64.encodeBytes(byte);
			return base64.toString();
		}

		public function DominoInputText()
		{
			super();
		}

		public var loader:URLLoader;

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

		private var _keyformulachoices:Boolean;

		public function get keyformulachoices():Boolean
		{
			return _keyformulachoices;
		}

		public function set keyformulachoices(value:Boolean):void
		{
			_keyformulachoices = value;
		}

		private var _text:String;

		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		private var _numberColumns:Number;

		public function get numberColumns():Number
		{
			return _numberColumns;
		}

		public function set numberColumns(value:Number):void
		{
			if (_numberColumns != value)
			{
				_numberColumns = value;
			}
		}

		private var _object:String;

		public function get object():String
		{
			return _object;
		}

		public function set object(value:String):void
		{
			_object = value;
		}

		private var _maxLength:String;

		public function get maxLength():String
		{
			return _maxLength;
		}

		public function set maxLength(value:String):void
		{
			_maxLength = value;
		}

		private var _idAttribute:String;

		public function get idAttribute():String
		{
			return _idAttribute;
		}

		public function set idAttribute(value:String):void
		{
			_idAttribute = value;
		}

		private var _nameAttribute:String;

		public function get nameAttribute():String
		{
			return _nameAttribute;
		}

		public function set nameAttribute(value:String):void
		{
			_nameAttribute = value;
		}

		private var _required:Boolean;

		public function get required():Boolean
		{
			return _required;
		}

		public function set required(value:Boolean):void
		{
			_required = value;
		}

		private var _allowmultivalues:Boolean;

		public function get allowmultivalues():Boolean
		{
			return _allowmultivalues;
		}

		public function set allowmultivalues(value:Boolean):void
		{
			_allowmultivalues = value;
		}

		private var _type:String;

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		private var _kind:String;

		/** Domino number field property name */

		/**
		 * <field allowmultivalues="true" allowtabout="false" computeaftervalidation="false" dataconnectionfield="data" defaultfocus="false" kind="editable" listdisplayseparator="semicolon" listinputseparators="comma semicolon" name="%FieldName%" protected="false" showdelimiters="true" sign="false" storelocally="false" type="number" useappletinbrowser="false">
		 *		<numberformat bytes="false" digits="2" format="general" parens="false" percent="false" preference="usersetting" punctuated="false"/>
		 * 	</field>
		 *
		 * <field allowmultivalues="false" allowtabout="false" computeaftervalidation="false" dataconnectionfield="data" defaultfocus="false" kind="editable" name="%FieldName%" protected="false" showdelimiters="true" sign="false" storelocally="false" type="text" useappletinbrowser="false"/>
		 */

		public function get kind():String
		{
			return _kind;
		}

		public function set kind(value:String):void
		{
			_kind = value;
		}

		/**
		 * <!ENTITY % numberformat.formats "general | fixed | scientific | currency">
		 */

		private var _format:String;

		public function get format():String
		{
			return _format;
		}

		public function set format(value:String):void
		{
			_format = value;
		}

		private var _digits:String;

		public function get digits():String
		{
			return _digits;
		}

		public function set digits(value:String):void
		{
			_digits = value;
		}

		//If true, displays large numbers with the thousands separator; for example, 1,000.
		private var _punctuated:Boolean;

		public function get punctuated():Boolean
		{
			return _punctuated;
		}

		public function set punctuated(value:Boolean):void
		{
			_punctuated = value;
		}

		//If true, displays negative numbers enclosed in parentheses; for example, (5) instead of -5.
		private var _parens:Boolean;

		//If true, displays values as percentages; for example, displays .10 as 10%.

		public function get parens():Boolean
		{
			return _parens;
		}

		public function set parens(value:Boolean):void
		{
			_parens = value;
		}

		private var _percent:Boolean;

		public function get percent():Boolean
		{
			return _percent;
		}

		public function set percent(value:Boolean):void
		{
			_percent = value;
		}

		//-------------data time type-----------------
		private var _show:String;

		public function get show():String
		{
			return _show;
		}

		public function set show(value:String):void
		{
			_show = value;
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

		private var _showtodaywhenappropriate:Boolean;

		public function get showtodaywhenappropriate():Boolean
		{
			return _showtodaywhenappropriate;
		}

		public function set showtodaywhenappropriate(value:Boolean):void
		{
			_showtodaywhenappropriate = value;
		}

		private var _fourdigityear:Boolean;

		public function get fourdigityear():Boolean
		{
			return _fourdigityear;
		}

		public function set fourdigityear(value:Boolean):void
		{
			_fourdigityear = value;
		}

		private var _fourdigityearfor21stcentury:Boolean;

		public function get fourdigityearfor21stcentury():Boolean
		{
			return _fourdigityearfor21stcentury;
		}

		public function set fourdigityearfor21stcentury(value:Boolean):void
		{
			_fourdigityearfor21stcentury = value;
		}

		private var _omitthisyear:Boolean;

		public function get omitthisyear():Boolean
		{
			return _omitthisyear;
		}

		public function set omitthisyear(value:Boolean):void
		{
			_omitthisyear = value;
		}

		private var _time:String;

		public function get time():String
		{
			return _time;
		}

		public function set time(value:String):void
		{
			_time = value;
		}

		private var _zone:String;

		public function get zone():String
		{
			return _zone;
		}

		public function set zone(value:String):void
		{
			_zone = value;
		}

		private var _calendar:String;

		public function get calendar():String
		{
			return _calendar;
		}

		public function set calendar(value:String):void
		{
			_calendar = value;
		}

		private var _defaultvalue:String;

		public function get defaultvalue():String
		{
			return _defaultvalue;
		}

		public function set defaultvalue(value:String):void
		{
			_defaultvalue = value;
		}

		private var _inputtranslation:String;

		public function get inputtranslation():String
		{
			return _inputtranslation;
		}

		public function set inputtranslation(value:String):void
		{
			_inputtranslation = value;
		}

		private var _inputvalidation:String;

		public function get inputvalidation():String
		{
			return _inputvalidation;
		}

		public function set inputvalidation(value:String):void
		{
			_inputvalidation = value;
		}

		private var _hidewhen:String;

		public function get hidewhen():String
		{
			return _hidewhen;
		}

		public function set hidewhen(value:String):void
		{
			_hidewhen = value;
		}

		private var _recalonchange:Boolean = false;

		public function get recalonchange():Boolean
		{
			return _recalonchange;
		}

		public function set recalonchange(value:Boolean):void
		{
			_recalonchange = value;
		}

		private var _recalcchoices:Boolean = false;

		public function get recalcchoices():Boolean
		{
			return _recalcchoices;
		}

		public function set recalcchoices(value:Boolean):void
		{
			_recalcchoices = value;
		}

		//-------------keyword type-----------------
		private var _keywords:String;

		public function get keywords():String
		{
			return _keywords;
		}

		public function set keywords(value:String):void
		{
			_keywords = value;
		}

		private var _keywordui:String;

		public function get keywordui():String
		{
			return _keywordui;
		}

		public function set keywordui(value:String):void
		{
			_keywordui = value;
		}

		private var _indent:String;
		public function get indent():String
		{
			return _indent;
		}
		public function set indent(value:String):void
		{
			_indent = value;
		}

		private var _outdent:String;
		public function get outdent():String
		{
			return _outdent;
		}
		public function set outdent(value:String):void
		{
			_outdent = value;
		}


		private var _inputProtected:Boolean;

		public function get inputProtected():Boolean
		{
			return _inputProtected;
		}

		public function set inputProtected(value:Boolean):void
		{
			_inputProtected = value;
		}

		private var _inputSeal:Boolean;

		public function get inputSeal():Boolean
		{
			return _inputSeal;
		}

		public function set inputSeal(value:Boolean):void
		{
			_inputSeal = value;
		}


		private var _inputSign:Boolean;

		public function get inputSign():Boolean
		{
			return _inputSign;
		}

		public function set inputSign(value:Boolean):void
		{
			_inputSign = value;
		}

		//-------------names type-----------------
		private var _choicesdialog:String;

		public function get choicesdialog():String
		{
			return _choicesdialog;
		}

		public function set choicesdialog(value:String):void
		{
			_choicesdialog = value;
		}

		private var _listinputseparators:String;

		public function get listinputseparators():String
		{
			return _listinputseparators;
		}

		public function set listinputseparators(value:String):void
		{
			_listinputseparators = value;
		}

		private var _listdisplayseparator:String;

		public function get listdisplayseparator():String
		{
			return _listdisplayseparator;
		}

		public function set listdisplayseparator(value:String):void
		{
			_listdisplayseparator = value;
		}

		private var _keywordsformula:String;

		public function get keywordsformula():String
		{
			return _keywordsformula;
		}

		public function set keywordsformula(value:String):void
		{
			_keywordsformula = value;
		}

		private var _formula:String;

		public function get formula():String
		{
			return _formula;
		}

		public function set formula(value:String):void
		{
			_formula = value;
		}

		private var _password:String;

		public function get password():String
		{
			return _password;
		}

		public function set password(value:String):void
		{
			_password = value;
		}

		private var _firstdisplay:String;

		public function get firstdisplay():String
		{
			return _firstdisplay;
		}

		public function set firstdisplay(value:String):void
		{
			_firstdisplay = value;
		}

		private var _securityOptionsInput:String;

		public function get securityOptionsInput():String
		{
			return _securityOptionsInput;
		}
		public function set securityOptionsInput(value:String):void
		{
			_securityOptionsInput = value;
		}

		private var _onlyallow:String;

		public function get onlyallow():String
		{
			return _onlyallow;
		}

		public function set onlyallow(value:String):void
		{
			_onlyallow = value;
		}


		private var _helpDescription:String;

		public function get helpDescription():String
		{
			return _helpDescription;
		}

		public function set helpDescription(value:String):void
		{
			_helpDescription = value;
		}

		private var _fieldHint:String;

		public function get fieldHint():String
		{
			return _fieldHint;
		}

		public function set fieldHint(value:String):void
		{
			_fieldHint = value;
		}

		//---------font /size  /color--------------------------------------------------------
		private var _size:String;

		public function get size():String
		{
			return _size;
		}

		public function set size(value:String):void
		{
			_size = value;
		}

		private var _color:String;

		public function get color():String
		{
			return _color;
		}

		public function set color(value:String):void
		{
			_color = value;
		}

		private var _fontStyle:String;

		public function get fontStyle():String
		{
			return _fontStyle;
		}

		public function set fontStyle(value:String):void
		{
			_fontStyle = value;
		}

		private var _fontName:String;

		public function get fontName():String
		{
			return _fontName;
		}

		public function set fontName(value:String):void
		{
			_fontName = value;
		}

		private var _pitches:String;

		public function get pitches():String
		{
			return _pitches;
		}

		public function set pitches(value:String):void
		{
			_pitches = value;
		}

		private var _familyid:String;

		public function get familyid():String
		{
			return _familyid;
		}

		public function set familyid(value:String):void
		{
			_familyid = value;
		
		}

		private var _truetype:String;

		public function get truetype():String
		{
			return _truetype;
		}

		public function set truetype(value:String):void
		{
			_truetype = value;
		}

		private var _htmlId:String;
		public function get htmlId():String
		{
			return _htmlId;
		}
        public function set htmlId(value:String):void
		{
				_htmlId = value;
		}

		private var _htmlClass:String;
		public function get htmlClass():String
		{
			return _htmlClass;
		}
        public function set htmlClass(value:String):void
		{
			_htmlClass = value;
		}

		private var _htmlStyle:String;
		public function get htmlStyle():String
		{
			return _htmlStyle;
		}
        public function set htmlStyle(value:String):void
		{
			_htmlStyle=value;
		}

		private var _htmlTitle:String;
		public function get htmlTitle():String
		{
			return _htmlTitle;
		}
        public function set htmlTitle(value:String):void
		{
			_htmlTitle=value;
		}

		private var _htmlOther:String;
		public function get htmlOther():String
		{
			return _htmlOther;
		}
        public function set htmlOther(value:String):void
		{
			_htmlOther=value;
		}

		//align 
		private var _alignPardef:String;
		public function get alignPardef():String
		{
			return _alignPardef;
		}
        public function set alignPardef(value:String):void
		{
			_alignPardef=value;
		}

		private var _firstlineleftmarginPardef:String;
		public function get firstlineleftmarginPardef():String
		{
			return _firstlineleftmarginPardef;
		}
        public function set firstlineleftmarginPardef(value:String):void
		{
			_firstlineleftmarginPardef=value;
		}

		private var _listPardef:String;
		public function get listPardef():String
		{
			return _listPardef;
		}
        public function set listPardef(value:String):void
		{
			_listPardef=value;
		}
		public function getComponentData():Object
		{
			var fieldType:String = "String";
			var fieldValue:Object = "";
			var fieldComment:String = "";
			if (this.keywordui == "checkbox")
			{
				fieldType = "Boolean";
				fieldValue = false;
			}
			else
			{
				fieldValue = "";
				fieldComment = StringHelperUtils.base64Decode(this.defaultvalue);
			}

			return {
				fields: [{
					name: this.nameAttribute,
					fieldValue: fieldValue,
					fieldType: fieldType,
					fieldComment: fieldComment
				}]
			}
		}


		private var _spacingInterline:String;
		public function get spacingInterline():String
		{
			return _spacingInterline;
		}
        public function set spacingInterline(value:String):void
		{
			_spacingInterline=value;
		}

		private var _spacingAbove:String;
		public function get spacingAbove():String
		{
			return _spacingAbove;
		}
        public function set spacingAbove(value:String):void
		{
			_spacingAbove=value;
		}

		private var _spacingBelow:String;
		public function get spacingBelow():String
		{
			return _spacingBelow;
		}
        public function set spacingBelow(value:String):void
		{
			_spacingBelow=value;
		}




		

		/** Domino number field property end */

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface,  lookup:ILookup):void
		{
			this.setComponentSize(xml);

			this.text = xml.@value;
			this.maxLength = xml.@maxlength;
			this.idAttribute = xml.@id;
			this.required = xml.@required == "true";
			this.nameAttribute = xml.@name;
			this.width = xml.@width;
			this.height = xml.@height;
			this.allowmultivalues = xml.@allowmultivalues == "true";
			this.type = xml.@type;
			this.kind = xml.@kind;
			if(xml.@indent){
				this.indent = xml.@indent;
			}
			if(xml.@outdent){
				this.outdent = xml.@outdent;
			}
			if(xml.@htmlId){
				this.htmlId = xml.@htmlId
			}
			if(xml.@htmlClass){
				this.htmlClass = xml.@htmlClass
			}
			if(xml.@htmlTitle){
				this.htmlTitle = xml.@htmlTitle
			}
			if(xml.@htmlStyle){
				this.htmlStyle = xml.@htmlStyle
			}
			if(xml.@htmlOther){
				this.htmlOther = xml.@htmlOther
			}
			if(xml.@color){
				this.color = xml.@color;
			}

			if(xml.@alignPardef){
				this.alignPardef = xml.@alignPardef;
			}

			if(xml.@listPardef){
				this.listPardef = xml.@listPardef;
			}

			if(xml.@pitches){
				this.pitches = xml.@pitches;
			}
			if(xml.@familyid){
				this.familyid = xml.@familyid;
			}
			if(xml.@truetype){
				this.truetype = xml.@truetype;
			}
			if(xml.@size){
				this.size = xml.@size;
			}
			if(xml.@fontName){
				this.fontName = xml.@fontName;
			}
			if(xml.@fontStyle){
				this.fontStyle = xml.@fontStyle;
			}

			

			this.numberColumns = xml.@numberColumns;
			if (xml.@keyformulachoices)
			{
				if (xml.@keyformulachoices.toString() == "false")
				{
					this.keyformulachoices = false;
				} else
				{
					this.keyformulachoices = true;
				}
			} else
			{
				this.keyformulachoices = false;
			}

			this.defaultvalue = xml.@defaultvalue;
			this.hidewhen = xml.@hidewhen;
			if(xml.@keywordsformula){
				this.keywordsformula = StringHelperUtils.base64Decode(xml.@keywordsformula);
			}
			
			this.inputvalidation = xml.@inputvalidation;
			this.inputtranslation = xml.@inputtranslation;
			this.hide = xml.@hide;
			this.helpDescription = xml.@helpDescription;
			this.fieldHint = xml.@fieldHint;

			if(xml.@spacingInterline){
				this.spacingInterline =xml.@spacingInterline;
			}
			if(xml.@spacingAbove){
				this.spacingAbove =xml.@spacingAbove;
			}

			if(xml.@spacingBelow){
				this.spacingBelow =xml.@spacingBelow;
			}
			//this.formula=xml.@formula;
			this.inputProtected = xml.@inputProtected;
			this.inputSeal = xml.@inputSeal;
			this.inputSign = xml.@inputSign;
			this.securityOptionsInput=xml.@securityOptionsInput;
			if (this.type == "number")
			{

				if (xml.@digits != null && xml.@digits.toString().length > 0)
				{
					this.digits = xml.@digits;
				} else
				{
					var numberFormatNode:XMLList = xml.descendants("numberformat");
					if (numberFormatNode != null && numberFormatNode[0])
						if (numberFormatNode[0].@digits)
						{
							this.digits = numberFormatNode[0].@digits;
						}
				}

				this.format = xml.@format;
				this.punctuated = xml.@punctuated == "true";
				this.parens = xml.@parens == "true";
				this.percent = xml.@percent == "true";
			}
			if (this.type == "datetime")
			{
				this.show = xml.@show;
				if (!this.show)
				{
					this.show = "datetime"
				}
				this.date = xml.@date;
				if (!this.date)
				{
					this.date = "yearmonthday"
				}
				this.showtodaywhenappropriate = xml.@showtodaywhenappropriate == "true";
				this.fourdigityear = xml.@fourdigityear == "true";
				this.fourdigityearfor21stcentury = xml.@fourdigityearfor21stcentury == "true";
				this.omitthisyear = xml.@omitthisyear == "true";
				this.time = xml.@time;
				this.zone = xml.@zone;
				this.calendar = xml.@calendars;
			}

			if (this.type == "keyword")
			{
				if(xml.@keywords){
					this.keywords = StringHelperUtils.base64Decode(xml.@keywords);
				}
				
				this.keywordui = xml.@keywordui
			}

			if(xml.@formula){
				this.formula = StringHelperUtils.base64Decode(xml.@formula)
			}

			if (this.type == "password")
			{
				this.password = xml.@password
			}

			if (this.type == "names")
			{
				this.choicesdialog = xml.@choicesdialog
			
			}
			if(xml.@listinputseparators){
				this.listinputseparators = xml.@listinputseparators
			}
			if(xml.@listdisplayseparator){
				this.listdisplayseparator = xml.@listdisplayseparator
			}
			
			

			if (this.type == "richtextlite")
			{
				this.onlyallow = xml.@onlyallow
				this.firstdisplay = xml.@firstdisplay
			}
		}

		public function toCode():XML
		{
			//for domino input field element must contain into par node
			var par_xml:XML;
			if(this.hide){
				par_xml = new XML("<par dominotype=\"dominoInputText\" def=\""+DominoGlobals.PardefDivId+"\"/>");
			}else{
				par_xml = new XML("<par dominotype=\"dominoInputText\"/>");
			}

			var runXML:XML = new XML("<run/>");
			var fontXml:XML = new XML("<font/>");
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

			/** Domino specified Propertys start
			 * follow propertys are not supported with moonshine ide , but if we need them we can consider add them in moonshine ide on later.
			 * these all propertys will default  to "false"
			 *
			 */
			if(this.listdisplayseparator){
				 xml.@listdisplayseparator = this.listdisplayseparator;
			}

			if(this.listinputseparators){
				 xml.@listinputseparators = this.listinputseparators;
			}

			//HTML core attrs
			if(this.htmlId){
				xml.@htmlid = this.htmlId;
			}
			if(this.htmlClass){
				xml.@htmlclass = this.htmlClass;
			}
			if(this.htmlTitle){
				xml.@htmltitle = this.htmlTitle;
			}
			if(this.htmlStyle){
				xml.@htmlstyle = this.htmlStyle;
			}
			if(this.htmlOther){
				xml.@htmlOther = this.htmlOther;
			}
			if(this.spacingInterline){
				xml.@linespacing = this.spacingInterline;
				par_xml.@spacingInterline = this.spacingInterline;
			}
			if(this.spacingAbove){
				xml.@spacebefore = this.spacingAbove;
				par_xml.@spacingAbove= this.spacingAbove;
			}
			if(this.spacingBelow){
				xml.@spaceafter = this.spacingBelow;
				par_xml.@spacingBelow = this.spacingBelow;
			}
			
			if (this.color != null && this.color.length > 0)
			{
				fontXml.@color = this.color;
			}

			if (this.size != null && this.size.length > 0)
			{
				fontXml.@size = this.size + "pt";
			}

			if (this.fontStyle != null&&this.fontStyle.length > 0)
			{
				fontXml.@style = this.fontStyle;
			}

			if (this.fontName != null && this.fontName.length > 0)
			{
				fontXml.@name = this.fontName;
			}

			xml.@useappletinbrowser = "false";
			xml.@allowtabout = "false";
			//xml.@dataconnectionfield="false";
			xml.@defaultfocus = "false";
			xml.@storelocally = "false";
			if (this.hidewhen)
			{
				xml.@hidewhen = this.hidewhen;
				par_xml.@hidewhen = this.hidewhen;
			}

			if(this.alignPardef){
				xml.@alignPardef = this.alignPardef;
				par_xml.@alignPardef = this.alignPardef;
			}

			if(this.indent){
				xml.@indent = this.indent;
				par_xml.@indent= this.indent;
			}
			if(this.outdent){
				xml.@outdent = this.outdent;
				par_xml.@outdent= this.outdent;
			}

			if(this.listPardef){
				xml.@listPardef = this.listPardef;
				par_xml.@listPardef = this.listPardef;
			}

			if (this.hide)
			{
				xml.@hide = this.hide;
				par_xml.@hide = this.hide;
			}
			if (this.inputvalidation!=null)
			{
				xml.@inputvalidation = this.inputvalidation;
			}

			if (this.inputtranslation)
			{
				xml.@inputtranslation = this.inputtranslation;
			}

			/**Domino specified Propertys end */

			if (this.text)
			{
				xml.@value = this.text;
			}

			//for now ,just default to text
			if (this.type)
			{
				xml.@type = this.type;
			}

			if (this.kind)
			{
				xml.@kind = this.kind;
				if (this.kind == "editable")
				{
					xml.@computeaftervalidation = "false";
				}
			}

			//for now ,just default to false,only input text
			if (this.allowmultivalues)
			{
				xml.@allowmultivalues = this.allowmultivalues;
			} else
			{
				xml.@allowmultivalues = "false";
			}

			if (this.width)
			{
				xml.@width = this.width + "pt";
			}
			if (this.height)
			{
				xml.@height = this.height + "pt";
			}

			if(this.helpDescription){
				xml.@description = this.helpDescription;
			}

			if(this.fieldHint){
				xml.@fieldHint = this.fieldHint;
			}

			xml.@bgcolor = "#ffffff";

			if (this.idAttribute)
			{
				xml.@id = this.idAttribute;
			}

			if (this.nameAttribute)
			{
				xml.@name = this.nameAttribute;
			}

			if (this.type == "number")
			{
				var number_format_xml:XML = new XML("<numberformat/>");
				if (this.digits)
				{
					number_format_xml.@digits = this.digits;

				}
				if (this.format)
				{
					number_format_xml.@format = this.format;
				}

				if (this.punctuated)
				{
					number_format_xml.@punctuated = this.punctuated;
				} else
				{
					number_format_xml.@punctuated = "false"
				}
				if (this.parens)
				{
					number_format_xml.@parens = this.parens;
				} else
				{
					number_format_xml.@parens = "false"
				}
				if (this.percent)
				{
					number_format_xml.@percent = this.percent;
				} else
				{
					number_format_xml.@percent = "false"
				}

				xml.appendChild(number_format_xml);
			}

			if (this.type == "datetime")
			{
				var datetime_format_xml:XML = new XML("<datetimeformat/>");
				if (this.show)
				{
					datetime_format_xml.@show = this.show;
				}
				if (this.date)
				{
					datetime_format_xml.@date = this.date;
				}

				if (this.showtodaywhenappropriate)
				{
					datetime_format_xml.@showtodaywhenappropriate = this.showtodaywhenappropriate;
				} else
				{
					datetime_format_xml.@showtodaywhenappropriate = "false"
				}
				if (this.fourdigityear)
				{
					datetime_format_xml.@fourdigityear = this.fourdigityear;
				} else
				{
					datetime_format_xml.@fourdigityear = "false"
				}
				if (this.fourdigityearfor21stcentury)
				{
					datetime_format_xml.@fourdigityearfor21stcentury = this.fourdigityearfor21stcentury;
				} else
				{
					datetime_format_xml.@fourdigityearfor21stcentury = "false"
				}


				if (this.omitthisyear)
				{
					datetime_format_xml.@omitthisyear = this.omitthisyear;
				} else
				{
					datetime_format_xml.@omitthisyear = "false"
				}

				if (this.time)
				{
					datetime_format_xml.@time = this.time;
				}
				if (this.zone)
				{
					datetime_format_xml.@zone = this.zone;
				}
				if (this.calendar)
				{
					datetime_format_xml.@calendar = this.calendar;
				}
				xml.appendChild(datetime_format_xml);
			}

			if (this.type == "keyword")
			{
				//<keywords allownew="false" columns="1" helperbutton="false" readingorder="lefttoright"
				//recalcchoices="false" ui="checkbox">
				//fix xml
				xml.@allowtabout = "false"
				xml.@borderstyle = "inset"
				
				
				xml.@lookupaddressonrefresh = "false"
				xml.@lookupeachchar = "false"
				xml.@protected = "false"
				xml.@showdelimiters = "true"
			
				xml.@storelocally = "false"
				xml.@useappletinbrowser = "false"

				var keyword_format_xml:XML = new XML("<keywords/>");
				if (this.keywordui)
				{
					keyword_format_xml.@ui = this.keywordui
					keyword_format_xml.@recalconchange = this.recalonchange.toString();
					keyword_format_xml.@recalcchoices = this.recalcchoices.toString();

					if (this.numberColumns)
					{
						keyword_format_xml.@columns = this.numberColumns.toString();
					}

					if (this.keywordui == "checkbox")
					{
						xml.@allowmultivalues="true"
					} else if (this.keywordui == "radiobutton")
					{
						xml.@allowmultivalues = "false"
					} else if (this.keywordui == "dialoglist")
					{
						keyword_format_xml.@allownew = "true"

					} else if (this.keywordui == "listbox")
					{
						keyword_format_xml.@allownew = "true"
						xml.@multiline = "true"
						xml.@usenotesstyle = "false"

					} else if (this.keywordui == "combobox")
					{
						keyword_format_xml.@allownew = "true"
						xml.@multiline = "true"
						xml.@usenotesstyle = "false"
					}

				} else
				{
					keyword_format_xml.@ui = "checkbox"
				}

				if (this.keyformulachoices == true)
				{
					if (this.keywordsformula)
					{
						var formula_xml_key:XML = new XML("<formula>" + this.keywordsformula + "</formula>");
						keyword_format_xml.appendChild(formula_xml_key)
					}
				} else
				{
					var textlist_format_xml:XML = new XML("<textlist/>");

					var myArrayOfLines:Array = this.keywords.split(/\n/);
					//
					for (var k:int = 0; k < myArrayOfLines.length; k = k + 1)
					{

						var text_format_xml:XML = new XML("<text>" + myArrayOfLines[k] + "</text>");
						textlist_format_xml.appendChild(text_format_xml)
					}
					keyword_format_xml.appendChild(textlist_format_xml)
				}

				xml.appendChild(keyword_format_xml);
			}

			var codeXML:XML = null;
			//this is text computed filed
			if (this.type == "text" || this.type == "keyword")
			{
				//for now the formula only add to default value

				if (!this.object)
				{
					this.object = "defaultvalue";
				}
				//DominoGlobals.PardefDivId
				var formulaXML:XML = null;
				if (this.defaultvalue)
				{
					codeXML = new XML("<code event=\"defaultvalue\"/>");
					formulaXML = new XML("<formula>" + this.defaultvalue + "</formula>");
					codeXML.appendChild(formulaXML);
					xml.appendChild(codeXML);
				}
				if (this.inputtranslation)
				{
					codeXML = new XML("<code event=\"inputtranslation\"/>");
					formulaXML = new XML("<formula>" + this.inputtranslation + "</formula>");
					codeXML.appendChild(formulaXML);
					xml.appendChild(codeXML);

				}
				if (this.inputvalidation)
				{
					codeXML = new XML("<code event=\"inputvalidation\"/>");
					var formula_xml3:XML = new XML("<formula>" + this.inputvalidation + "</formula>");
					codeXML.appendChild(formula_xml3);
					xml.appendChild(codeXML);
				}
			}

			if (this.type == "names")
			{
				xml.@choicesdialog = this.choicesdialog;
				if (!this.listinputseparators)
				{
					xml.@listinputseparators = "comma semicolon newline"
				}

				if (!this.listdisplayseparator)
				{
					xml.@listdisplayseparator = "newline"
				}
			}

			if (this.type == "richtextlite")
			{
				xml.@firstdisplay = firstdisplay;
				xml.@onlyallow = onlyallow;
			}

			if(this.securityOptionsInput&& this.securityOptionsInput.length>0){
				if(this.securityOptionsInput.indexOf("sign")>=0){
					xml.@sign = "true";
				}else{
					xml.@sign = "false";
				}
				if(this.securityOptionsInput.indexOf("seal")>=0){
					xml.@seal = "true";
				}else{
					xml.@seal = "false";
				}

				if(this.securityOptionsInput.indexOf("protected")>=0){
					xml.@protected = "true";
				}else{
					xml.@protected = "false";
				}
				
			}

			if(this.color || this.size || this.fontStyle || this.fontName)
			{
				runXML.appendChild(fontXml);
				runXML.appendChild(xml);
				par_xml.appendChild(runXML);
			}else{
				par_xml.appendChild(xml);
			}

			// if(par_xml.toXMLString().indexOf("align")>0){
			// 	Alert.show("align:"+par_xml);
			// }

			return par_xml;
		}

		//</j:ComboBox>
		public function toRoyaleConvertCode():XML
		{
			var componentNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");

			var componentXML:XML = new XML("<" + ROYALE_ELEMENT_NAME_TEXT + ">" + "</" + ROYALE_ELEMENT_NAME_TEXT + ">");
				componentXML.@text = "{$valueobject." + this.nameAttribute + "}";
				componentXML.@className = "readOnlyInput";

			if (this.type == "text" || this.type == "number")
			{
				componentXML.@change = "{$valueobject." + this.nameAttribute + " = event.currentTarget.text;}";
			}

			if (this.type == "datetime")
			{
				componentXML = new XML("<" + ROYALE_ELEMENT_NAME_DATE + ">" + "</" + ROYALE_ELEMENT_NAME_DATE + ">");
				componentXML.@dateFormat = "MM/DD/YYYY";
				componentXML.@className = "readOnlyDateField";
			}

			if (this.type == "keyword")
			{
				if (this.keywordui == "checkbox")
				{
					componentXML = new XML("<" + ROYALE_ELEMENT_NAME_CHECKBOX + ">" + "</" + ROYALE_ELEMENT_NAME_CHECKBOX + ">");
					componentXML.@text = this.text;
					componentXML.@className = "";
				}
			}

			var beadsXML:XML = new XML("<beads />");
				beadsXML.setNamespace(componentNamespace);
			var disabledXML:XML = new XML("<Disabled/>");
				disabledXML.setNamespace(componentNamespace);
				disabledXML.@disabled = "{isDisabled}";

			beadsXML.appendChild(disabledXML);
			componentXML.appendChild(beadsXML);

			if (this.type == "richtext")
			{
				componentXML = new XML("<" + ROYALE_ELEMENT_NAME_JODIT  + ">" + "</" + ROYALE_ELEMENT_NAME_JODIT + ">");
				componentXML.@data = "{$valueobject." + this.nameAttribute + "}";
				componentXML.@textChange = "{$valueobject." + this.nameAttribute + " = event.target.data;}";
				componentXML.@readonly = "{isDisabled}";
				componentXML.@toolbarVisible = "{!isDisabled}";
				componentXML.@options = "{{" +
						"allowResizeY: !isDisabled, " +
						"showCharsCounter: !isDisabled, " +
						"showWordsCounter: !isDisabled, " +
						"showXPathInStatusbar: !isDisabled, " +
						"inline: isDisabled, " +
						"defaultLineHeight: isDisabled ? 0.25 : null" +
						"}}";
				componentXML.@className = "";
				componentNamespace = new Namespace("joditeditor", "classes.joditeditor.*");
			}

			componentXML.addNamespace(componentNamespace);
			componentXML.setNamespace(componentNamespace);

			return componentXML;
		}

		public function checkFormula(formula:String):void
		{
			var req:URLRequest = new URLRequest();
			loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			var params:URLVariables = new URLVariables();

			params.formula = base64Encode(formula);

			req.data = params;
			req.requestHeaders.push(new URLRequestHeader('Content-Type', 'application/x-www-form-urlencoded'));
			req.url = "http://localhost:8080/dominoFormula/parse?formula=" + params.formula;
			req.method = URLRequestMethod.POST;

			dominoFormulaHandler(req);
		}

		protected function dominoFormulaHandler(req:URLRequest):void
		{
			loader = new ApacheURLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;

			loader.addEventListener(Event.COMPLETE, handleFormulaComplete);
			loader.addEventListener(ErrorEvent.ERROR, handleFormulaError);
			loader.addEventListener(IOErrorEvent.IO_ERROR, handleFormulaIOError);

			loader.load(req);
		}

		protected function handleFormulaError(e:* = null):void
		{

		}

		protected function handleFormulaIOError(e:* = null):void
		{

		}

		protected function handleFormulaComplete(event:Event):void
		{

		}
	}
}