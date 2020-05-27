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
			this.fontStyle=xml.@style
			

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
			var code_string:String=fixSpecailCharacter(this.text)
			var par_xml:XML = new XML("<par/>");
           
			var font_xml:XML =  new XML("<font/>");
				if(this.color){
					font_xml.@color=this.color;
				}

				if(this.size){
					font_xml.@size=this.size +"pt";
				}

				if(this.fontStyle){
					font_xml.@style=this.fontStyle;
				}


			var xml:XML=new XML();
			// if(_font!=null){
				

			// 	if(_font.style){
			// 		font_xml.@style=_font.style
			// 	}

			// 	if(_font.name){
			// 		font_xml.@name=_font.name
			// 	}

			
			// 	font_xml.@truetype=_font.truetype
				
				
			// 	if(_font.pitch){
			// 		font_xml.@pitch=_font.pitch
			// 	}
			// }

			//CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			//Alert.show("font_xml:"+font_xml.toXMLString());
			 var run_xml:XML = new XML("<run>"+font_xml.toXMLString()+code_string+"</run>");
			//run_xml.appendChild(font_xml);
			//run_xml.appendChild(xml.createTextNode(this.text));
			if(this.par!=null){
				if(this.par.def!=null){
					par_xml.@def=this.par.def;
				}
			}
		
			par_xml.appendChild(run_xml);

            return par_xml;
		}

		public static const AMPERSAND:String = "&amp;" 
		public static const APOSTROPHE:String  = "&apos;" 
		public static const DBL_QUOTES:String  = "&quot;" 
		public static const GT:String  = "&gt;" 
		public static const LT:String  = "&lt;" 


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

			return text


		}
    }
}