package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoInputText;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;


	/** 
	 * Domino filed element dxl format , more details please view follow url
	 * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_FIELD_ELEMENT_XML.html
	*/

	public class DominoInputText extends ComponentBase implements IDominoInputText
	{
		public static const DOMINO_ELEMENT_NAME:String = "field";
        public static const ELEMENT_NAME:String = "Field";

		public function DominoInputText()
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
		
		private var _text:String;
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
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
		public function get kind():String
		{
			return _kind;
		}
		public function set kind(value:String):void
		{
			_kind = value;
		}

		/** Domino number field property name */
		
		/**
		 * <field allowmultivalues="true" allowtabout="false" computeaftervalidation="false" dataconnectionfield="data" defaultfocus="false" kind="editable" listdisplayseparator="semicolon" listinputseparators="comma semicolon" name="%FieldName%" protected="false" showdelimiters="true" sign="false" storelocally="false" type="number" useappletinbrowser="false">
		 *		<numberformat bytes="false" digits="2" format="general" parens="false" percent="false" preference="usersetting" punctuated="false"/>
		 * 	</field>
		 * 
		 * <field allowmultivalues="false" allowtabout="false" computeaftervalidation="false" dataconnectionfield="data" defaultfocus="false" kind="editable" name="%FieldName%" protected="false" showdelimiters="true" sign="false" storelocally="false" type="text" useappletinbrowser="false"/>
		 */

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

		private var _punctuated:Boolean
		public function get punctuated():Boolean
		{
			return _punctuated;
		}
		public function set punctuated(value:Boolean):void
		{
			_punctuated = value;
		}

		//If true, displays negative numbers enclosed in parentheses; for example, (5) instead of -5.
		private var _parens:Boolean
		public function get parens():Boolean
		{
			return _parens;
		}
		public function set parens(value:Boolean):void
		{
			_parens = value;
		}

		//If true, displays values as percentages; for example, displays .10 as 10%.

		private var _percent:Boolean
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



		private var _showtodaywhenappropriate:Boolean
		public function get showtodaywhenappropriate():Boolean
		{
			return _showtodaywhenappropriate;
		}
		public function set showtodaywhenappropriate(value:Boolean):void
		{
			_showtodaywhenappropriate = value;
		}


		private var _fourdigityear:Boolean
		public function get fourdigityear():Boolean
		{
			return _fourdigityear;
		}
		public function set fourdigityear(value:Boolean):void
		{
			_fourdigityear = value;
		}


		private var _fourdigityearfor21stcentury:Boolean
		public function get fourdigityearfor21stcentury():Boolean
		{
			return _fourdigityearfor21stcentury;
		}
		public function set fourdigityearfor21stcentury(value:Boolean):void
		{
			_fourdigityearfor21stcentury = value;
		}


		private var _omitthisyear:Boolean
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

		/** Domino number field property end */

	
		
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			
			this.text = xml.@value;
			this.maxLength = xml.@maxlength;
            this.idAttribute = xml.@id;
            this.required = xml.@required == "true";
			this.nameAttribute = xml.@name;
			this.width=xml.@width;
			this.height=xml.@height;
			this.allowmultivalues=xml.@allowmultivalues == "true";
			this.type=xml.@type;
			this.kind=xml.@kind;

			if(this.type=="number"){
				this.digits= xml.@digits;
                this.format=xml.@format  ;
                this.punctuated=xml.@punctuated =="true";
                this.parens=xml.@parens =="true" ;
                this.percent=xml.@percent =="true" ;
			}
			if(this.type=="datetime"){
				this.show= xml.@show;
				if(!this.show){
					this.show="datetime"
				}
				this.date= xml.@date;
				if(!this.date){
					this.date="yearmonthday"
				}
				this.showtodaywhenappropriate=xml.@showtodaywhenappropriate =="true" ;
				this.fourdigityear=xml.@fourdigityear =="true" ;
				this.fourdigityearfor21stcentury=xml.@fourdigityearfor21stcentury =="true" ;
				this.omitthisyear=xml.@omitthisyear =="true" ;
				this.time= xml.@time;
				this.zone= xml.@zone;
				this.calendar= xml.@calendar;
			}	

			if(this.type=="keyword"){
				this.keywords=xml.@keywords
				this.keywordui=xml.@keywordui
			}
		}

		
		
		public function toCode():XML
		{
			
			//for domino input field element must contain into par node
			var par_xml:XML = new XML("<par/>");
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
            // var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            // xml.addNamespace(primeFacesNamespace);
            // xml.setNamespace(primeFacesNamespace);

			//CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			
			/** Domino specified Propertys start
			 * follow propertys are not supported with moonshine ide , but if we need them we can consider add them in moonshine ide on later.
			 * these all propertys will default  to "false"
			 * 
			 */
			
			xml.@useappletinbrowser="false";
			xml.@allowtabout="false";
			//xml.@dataconnectionfield="false";
			xml.@defaultfocus="false";
			xml.@protected="false";
			xml.@sign="false";
			xml.@storelocally="false";

			/**Domino specified Propertys end */
			
			if (this.text)
            {
                xml.@value = this.text;
            }

			//for now ,just default to text
			if(this.type){
				 xml.@type = this.type;
			}


			if(this.kind){
				 xml.@kind = this.kind;
				 if(this.kind=="editable"){
					 xml.@computeaftervalidation="false";
				 }
				 
			}
           
			//for now ,just default to false,only input text
			if(this.allowmultivalues){
				xml.@allowmultivalues=this.allowmultivalues;
			}else{
				xml.@allowmultivalues="false";
			}
			
			if(this.width){
				xml.@width=this.width+"pt";
			}
			if(this.height){
				xml.@height=this.height+"pt";
			}
		

			xml.@bgcolor="#ffffff";

            if (this.idAttribute)
            {
                xml.@id = this.idAttribute;
				//xml.@name = this.idAttribute;
            }

			if(this.nameAttribute)
			{
				xml.@name = this.nameAttribute;
			}

			if(this.type=="number"){
				var number_format_xml:XML = new XML("<numberformat/>");
				if(this.digits){
					number_format_xml.@digits = this.digits;
				}
				if(this.format){
					number_format_xml.@format = this.format;
				}

				if(this.punctuated){
					number_format_xml.@punctuated = this.punctuated;
				}else{
					number_format_xml.@punctuated = "false"
				}
				if(this.parens){
					number_format_xml.@parens = this.parens;
				}else{
					number_format_xml.@parens = "false"
				}
				if(this.percent){
					number_format_xml.@percent = this.percent;
				}else{
					number_format_xml.@percent = "false"
				}

				xml.appendChild(number_format_xml);
			}

			if(this.type=="datetime"){
					var datetime_format_xml:XML = new XML("<datetimeformat/>");
					if(this.show){
						datetime_format_xml.@show = this.show;
					}
					if(this.date){
						datetime_format_xml.@date = this.date;
					}

					if(this.showtodaywhenappropriate){
						datetime_format_xml.@showtodaywhenappropriate = this.showtodaywhenappropriate;
					}else{
						datetime_format_xml.@showtodaywhenappropriate = "false"
					}
					if(this.fourdigityear){
						datetime_format_xml.@fourdigityear = this.fourdigityear;
					}else{
						datetime_format_xml.@fourdigityear = "false"
					}
					if(this.fourdigityearfor21stcentury){
						datetime_format_xml.@fourdigityearfor21stcentury = this.fourdigityearfor21stcentury;
					}else{
						datetime_format_xml.@fourdigityearfor21stcentury = "false"
					}


					if(this.omitthisyear){
						datetime_format_xml.@omitthisyear = this.omitthisyear;
					}else{
						datetime_format_xml.@omitthisyear = "false"
					}

					if(this.time){
						datetime_format_xml.@time = this.time;
					}
					if(this.zone){
						datetime_format_xml.@zone = this.zone;
					}
					if(this.calendar){
						datetime_format_xml.@calendar = this.calendar;
					}
					xml.appendChild(datetime_format_xml);
			}

			if(this.type=="keyword"){
				//<keywords allownew="false" columns="1" helperbutton="false" readingorder="lefttoright" 
				//recalcchoices="false" ui="checkbox">
				//fix xml 
				xml.@allowtabout="false"
				xml.@borderstyle="inset"
				xml.@listdisplayseparator="comma"
				xml.@listinputseparators="comma"
				xml.@lookupaddressonrefresh="false"
				xml.@lookupeachchar="false"
				xml.@protected="false"
				xml.@showdelimiters="true"
				xml.@sign="false"
				xml.@storelocally="false"
				xml.@useappletinbrowser="false"
				
				var keyword_format_xml:XML = new XML("<keywords/>");
				if(this.keywordui){
					keyword_format_xml.@ui=this.keywordui
					if(this.keywordui=="checkbox"){
						//xml.@allowmultivalues="true"
					}else  if(this.keywordui=="radiobutton"){
						xml.@allowmultivalues="false"
					}else  if(this.keywordui=="dialoglist"){
						keyword_format_xml.@allownew="true"

					}else  if(this.keywordui=="listbox"){
						keyword_format_xml.@allownew="true"
						xml.@multiline="true"
						xml.@usenotesstyle="false"

					}else  if(this.keywordui=="combobox"){
						keyword_format_xml.@allownew="true"
						xml.@multiline="true"
						xml.@usenotesstyle="false"

					}
					
					else  {
						//xml.@allowmultivalues="false"
					}
					
				}else{
					keyword_format_xml.@ui="checkbox"
				}

				if(this.keywords){

					var textlist_format_xml:XML = new XML("<textlist/>");

					var myArrayOfLines:Array = this.keywords.split(/\n/);
					//
					for(var k:int = 0; k < myArrayOfLines.length; k=k+1)
					{
						
						var text_format_xml:XML = new XML("<text>"+myArrayOfLines[k]+"</text>");
						textlist_format_xml.appendChild(text_format_xml)
					}


					keyword_format_xml.appendChild(textlist_format_xml)


				}

				//keyword_format_xml.@allownew="false"
				keyword_format_xml.@columns="1"
				// keyword_format_xml.@helperbutton="false"
				// keyword_format_xml.@readingorder="lefttoright"
				// keyword_format_xml.@recalcchoices="false"



				xml.appendChild(keyword_format_xml)

				
				
			}

			par_xml.appendChild(xml);

            return par_xml;
		}
	}
}