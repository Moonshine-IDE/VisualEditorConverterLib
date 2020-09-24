package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoInputText;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;
	import flash.utils.ByteArray;
	import mx.controls.Alert;

	import mx.events.FlexEvent;

	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.net.URLRequestHeader;
	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.events.HTTPStatusEvent
	//import flash.events.NativeProcessExitEvent;
	import flash.events.ProgressEvent;

	import 	mx.utils.Base64Encoder;

	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ErrorEvent

	import org.apache.flex.packageflexsdk.util.ApacheURLLoader;

	import global.domino.DominoGlobals;


	/** 
	 * Domino filed element dxl format , more details please view follow url
	 * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_FIELD_ELEMENT_XML.html
	*/

	/** Domino field
	 *Client: Default value,Input Translation, Input Validation, Input Enabled,HTML attribute
	 *Web: onBlur,onChange,onClick,onFocus,onKeyDown,onKeyPress,onKeyUp,onMouseDown,onMouseUp,onMouseMove,OnMouseOut,OnMouseOver,onSelect,
	 *Client:(option),(Declarations),Entering,Exiting,Initialize,Terminate
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


		private var _onlyallow:String;
		public function get onlyallow():String
		{
			return _onlyallow;
		}
		public function set onlyallow(value:String):void
		{
			_onlyallow = value;
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
			//this.formula=xml.@formula;

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

			//if(this.type=="formula"){
				this.formula=xml.@formula
			//}

			if(this.type=="password"){
				this.password=xml.@password
			}

			if(this.type=="names"){
				this.choicesdialog=xml.@choicesdialog
				this.listinputseparators=xml.@listinputseparators
				this.listdisplayseparator=xml.@listdisplayseparator
			}

			if(this.type=="richtextlite"){
				this.onlyallow=xml.@onlyallow
				this.firstdisplay=xml.@firstdisplay
			}

			
		}

		
		
		public function toCode():XML
		{
			var pardef_xml:XML=null;
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
			if(this.hidewhen){
				xml.@hidewhen=this.hidewhen
			}
			if(this.inputvalidation){
				xml.@inputvalidation=this.inputvalidation;
			}

			if(this.inputtranslation){
				xml.@inputtranslation=this.inputtranslation;
			}

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
			//this is text computed filed
			if(this.type=="text"){
				//for now the formula only add to default value
				
					//Alert.show("formula:"+this.formula);
					//checkFormula(this.formula);
					if(!this.object){
						this.object="defaultvalue";
					}
					//DominoGlobals.PardefDivId
					if(this.defaultvalue){
						var code_xml:XML = new XML("<code event=\"defaultvalue\"/>");
						var formula_xml:XML=new XML("<formula>"+this.defaultvalue+"</formula>");
						code_xml.appendChild(formula_xml);
						xml.appendChild(code_xml);
					}
					// if(this.hidewhen){
					// 	DominoGlobals.PardefDivId++;
					// 	pardef_xml = new XML("<pardef id=\""+DominoGlobals.PardefDivId+"\"/>");
						
						
					// 	var code_xml:XML = new XML("<code event=\"hidewhen\"/>");
					// 	var formula_xml:XML=new XML("<formula>"+this.hidewhen+"</formula>");
					// 	code_xml.appendChild(formula_xml);
					// 	pardef_xml.appendChild(code_xml);

					// 	par_xml.@id=DominoGlobals.PardefDivId;
						

					// }

				
				
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
			if(this.type=="names"){
				xml.@choicesdialog= this.choicesdialog;
				if(this.listinputseparators){
					xml.@listinputseparators=this.listinputseparators;
				}else{
					xml.@listinputseparators="comma semicolon newline"
				}

				if(this.listdisplayseparator){
					xml.@listdisplayseparator=this.listdisplayseparator;
				}else{
					xml.@listdisplayseparator="newline"
				};
			}

			if(this.type=="formula"){
				//xml.@useappletinbrowser="false"
			}

			if(this.type=="password"){

			}

			if(this.type=="richtextlite"){
				xml.@firstdisplay= firstdisplay
				xml.@onlyallow= onlyallow
			}


			par_xml.appendChild(xml);

			// if(pardef_xml){
			// 	var temp_string=pardef_xml.toXMLString()+par_xml.toXMLString();
			// 	//Alert.show("hidewhen:");
			// 	//par_xml = new XML();
				
			// }

            return par_xml;
		}

		public var loader : URLLoader ;
		protected function dominoFormulaHandler(req:URLRequest):void
		{
			loader = new ApacheURLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			
			loader.addEventListener(Event.COMPLETE, handleFormulaComplete);
			loader.addEventListener(ErrorEvent.ERROR, handleFormulaError);
			loader.addEventListener(IOErrorEvent.IO_ERROR, handleFormulaIOError);
			
			loader.load(req);
		}
		protected function handleFormulaComplete(event:Event):void
		{
			try
			{
				Alert.show("result:"+event.target.data);
			}catch(e:Error){

			}	
		}
		protected function handleFormulaError(e:* = null):void
		{
			Alert.show("error:"+e.toString())
		}
		protected function handleFormulaIOError(e:* = null):void
		{
					Alert.show("error:"+e.toString())
		}
        public function checkFormula(formula:String) : void{
            var req : URLRequest = new URLRequest();
            loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
            var params : URLVariables = new URLVariables();
                  
            //encoder.encode(formula);
			
            params.formula = base64Encode(formula);
			Alert.show("params.formula:"+params.formula);
            req.data = params;
			req.requestHeaders.push(new URLRequestHeader('Content-Type', 'application/x-www-form-urlencoded'));
			req.url="http://localhost:8080/dominoFormula/parse?formula="+params.formula;
            req.method = URLRequestMethod.POST;
            //loader.addEventListener(ProgressEvent.PROGRESS,urlStream_progressHandler);
            //loader.addEventListener(Event.COMPLETE, urlLoader_complete);
			dominoFormulaHandler(req);
			// loader.addEventListener(Event.COMPLETE,eventComplete);
			// loader.addEventListener(IOErrorEvent.IO_ERROR,ioerror);
			// loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
        	// loader.addEventListener(Event.OPEN, onOpen);
        	// loader.addEventListener(Event.ACTIVATE, onActivate);
			// loader.load(req);
			// function eventComplete(e:Event):void
			// {
			// 	Alert.show('result:' + e.target.data.toString());
			// }
        }
		public static function base64Encode(str:String, charset:String = "UTF-8"):String{
			if((str==null)){
				return "";
			}
			var base64:Base64Encoder = new Base64Encoder();
			base64.insertNewLines = false;
			var byte:ByteArray = new ByteArray();
			byte.writeMultiByte(str, charset);
			base64.encodeBytes(byte);
			return base64.toString();
		}
		private function httpStatusHandler(event:HTTPStatusEvent):void {
        	Alert.show("httpStatusHandler: " + event);
    	}

		protected function onOpen(e:Event):void
		{
			Alert.show(e.toString());
		}

		protected function onActivate(e:Event):void
		{
			Alert.show(e.toString());
		}
		protected function ioerror(e:Event):void
		{
			Alert.show("Connection Error:"+e.toString());
		}
        protected function urlLoader_complete(evt:Event):void {
            var dataSet:String  = loader.data;
            Alert.show("dataSet:"+dataSet);
            
        }
        protected function urlStream_progressHandler(event:ProgressEvent):void
		{
			//dispatchEvent(event);
		} 

		
	}
}