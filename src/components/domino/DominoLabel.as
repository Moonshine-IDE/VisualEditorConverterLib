package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoLabel;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	import components.domino.DominoFont;
	import components.domino.DominoPar;
	import components.domino.DominoRun;

	import mx.controls.Alert;
	import global.domino.DominoGlobals;
	/** 
	 * Domino text element dxl format 
        dxl example of text 
        <par def='6'><run><font color='blue'/>
        example string .....
        </run></par>
	*/
	public class DominoLabel extends ComponentBase implements IDominoLabel
	{
        
		public function DominoLabel()
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
		//------------comenent start------------------
		private var _hidewhen:String;
		public function get hidewhen():String
		{
			return _hidewhen;
		}
		public function set hidewhen(value:String):void
		{
			_hidewhen = value;
		}
		private var _font:DominoFont;
		public function set font(font:DominoFont):void
		{
			_font = font;
		}
		public function get font():DominoFont
		{
			return _font ;
		}

		private var _par:DominoPar;
		public function set par(par:DominoPar):void
		{
			_par = par;
		}
		public function get par():DominoPar
		{
			return _par ;
		}

		private var _run:DominoRun;
		public function set run(run:DominoRun):void
		{
			_run = run;
		}
		public function get run():DominoRun
		{
			return _run ;
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

		//-------------other componetn end-------------
		
		
		private var _text:String;
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		//------------ font start------------------------

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


		private var _isUrlLink:String;
		public function get isUrlLink():String
		{
			return _isUrlLink;
		}
		public function set isUrlLink(value:String):void
		{
			_isUrlLink = value;
		}

		private var _urlLinkHref:String;
		public function get urlLinkHref():String
		{
			return _urlLinkHref;
		}
		public function set urlLinkHref(value:String):void
		{
			_urlLinkHref = value;
		}

		//showborder

		private var _showBorder:String;
		public function get showBorder():String
		{
			return _showBorder;
		}
		public function set showBorder(value:String):void
		{
			_showBorder = value;
		}

		private var _isNewLine:String;
		public function get isNewLine():String
		{
			return _isNewLine;
		}
		public function set isNewLine(value:String):void
		{
			_isNewLine = value;
		}


        public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			//Alert.show("lable xml:"+xml.toXMLString());
			//Alert.show("lable text:"+ xml.children()[0].toString());

			if(xml.children()[0]!=null){
				this.text =unescape(xml.children()[0].toString());
			}else{
				this.text = unescape(xml.toString());
			}

			this.color=xml.@color;
			this.size=xml.@size;
			this.fontStyle=xml.@style;
			
			this.formula=xml.@formula;
			this.hidewhen=xml.@hidewhen;

			this.isUrlLink=xml.@isUrlLink;
			this.urlLinkHref=xml.@urlLinkHref;
			this.showBorder=xml.@showborder;
			if(xml.@isNewLine){
				this.isNewLine=xml.@isNewLine;
			}else{
				this.isNewLine="false";
			}
			
			

			// var elementsXML:XMLList = xml.elements();
            // var childCount:int = elementsXML.length();
            // for(var i:int = 0; i < childCount; i++)
            // {
            //     var childXML:XML = elementsXML[i];
			// 	if(childXML.name=="font"){
			// 		if(childXML.@style)
			// 		this.font.style=childXML.@style;
			// 		if(childXML.@color)
			// 		this.font.color=childXML.@color;
			// 		if(childXML.@size)
			// 		this.font.size=childXML.@size;
			// 		if(childXML.@name)
			// 		this.font.name=childXML.@name;
			// 		if(childXML.@truetype)
			// 		this.font.truetype=childXML.@truetype;
			// 		if(childXML.@pitch)
			// 		this.font.pitch=childXML.@pitch;
			// 	}
			// 	if(childXML.name=="run"){
			// 		this.run.html=childXML.@html
			// 		if(childXML.@highlight)
			// 		this.run.highlight=childXML.@highlight
			// 	}
			// 	if(childXML.name=="par"){
			// 		this.par.def=childXML.@def;
			// 	}
            //     //childFromXMLCallback(component, childXML);
            // }
			
		}
		
		public function toCode():XML
		{
			
			//for domino input field element must contain into par node
			//Alert.show("code_string 1:"+this.text+":");
			var code_string:String=fixSpecailCharacter(this.text)
			var parXML:XML = new XML("<par/>");
           
			var fontXml:XML =  new XML("<font/>");
				if(this.color){
					fontXml.@color=this.color;
				}

				if(this.size){
					fontXml.@size=this.size +"pt";
				}

				if(this.fontStyle){
					fontXml.@style=this.fontStyle;
				}


			var xml:XML=new XML();
			// if(_font!=null){
				

			// 	if(_font.style){
			// 		fontXml.@style=_font.style
			// 	}

			// 	if(_font.name){
			// 		fontXml.@name=_font.name
			// 	}

			
			// 	fontXml.@truetype=_font.truetype
				
				
			// 	if(_font.pitch){
			// 		fontXml.@pitch=_font.pitch
			// 	}
			// }

			//CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			//Alert.show("code_string 2:"+code_string+":");
			 var runXml:XML = new XML("<run>"+fontXml.toXMLString()+code_string+"</run>");
			//Alert.show("runXml 2:"+runXml.toXMLString());
			//runXml.appendChild(fontXml);
			//runXml.appendChild(xml.createTextNode(this.text));
			if(this.par!=null){
				if(this.par.def!=null){
					parXML.@def=this.par.def;
				}
			}

			if(this.isUrlLink=="true"){
				//craete  a new link node 
				var linkXml:XML = new XML("<urllink></urllink>");
				linkXml.@href=this.urlLinkHref;
				linkXml.@showborder=this.showBorder;
				linkXml.appendChild(runXml);
				parXML.appendChild(linkXml);

			}else{
				//no link direction add the run node 
				if(this.isNewLine=="true"){
					var blankRunXml:XML = new XML("<run></run>");
					var blankFontXml:XML= new XML("<font color=\"system\" size=\"12pt\" style=\"normal\"/>");
					blankRunXml.appendChild(blankFontXml);
					blankRunXml.appendChild(new XML("     "));
					parXML.appendChild(blankRunXml);
					parXML.@isNewLine = "true";
					parXML.@paragraph = "true";
				}else{
					parXML.appendChild(runXml);
					parXML.@isNewLine = "false";
				}
				
			}
		
			
			
			if(this.hidewhen){
				parXML.@hidewhen = this.hidewhen;
				parXML.@dominotype="label";
			}

			//setting par def id
			// if(this.hidewhen){
			// 	DominoGlobals.PardefDivId++;
			// 	var pardef_xml:XML = new XML("<pardef id=\""+DominoGlobals.PardefDivId+"\"/>");
				
				
			// 	var code_xml:XML = new XML("<code event=\"hidewhen\"/>");
			// 	var formula_xml:XML=new XML("<formula>"+this.hidewhen+"</formula>");
			// 	code_xml.appendChild(formula_xml);
			// 	pardef_xml.appendChild(code_xml);

			// 	parXML.@def=DominoGlobals.PardefDivId;
					

			// }

            return parXML;
		}

		public static const AMPERSAND:String = "&amp;" 
		public static const APOSTROPHE:String  = "&apos;" 
		public static const DBL_QUOTES:String  = "&quot;" 
		public static const GT:String  = "&gt;" 
		public static const LT:String  = "&lt;" 
		public static const SPEACE:String  = "&#160;"
		 


		private function fixSpecailCharacter(text:String):String
		{
		

			var amppattern:RegExp = /&/g;
			text = text.replace(amppattern,AMPERSAND);
			
			var ltpattern:RegExp = /</g;
			text = text.replace(ltpattern,LT);
			var gtpattern:RegExp = />/g;
			text = text.replace(gtpattern,GT);

			var qtpattern:RegExp = /"/g;
			text = text.replace(qtpattern,DBL_QUOTES);

		

			var aposattern:RegExp = /'/g;
			text = text.replace(aposattern,APOSTROPHE);

			var speace:RegExp = / /g;
			text = text.replace(speace,SPEACE);

			// var speace:RegExp = /&#160;/g;
			// text = text.replace(speace,SPEACE);

			

			return text


		}
    }
}