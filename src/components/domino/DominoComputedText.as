package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoComputedText;

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
	public class DominoComputedText extends ComponentBase implements IDominoComputedText
	{
        
		public function DominoComputedText()
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
		
		
		// private var _text:String;
		// public function get text():String
		// {
		// 	return _text;
		// }

		// public function set text(value:String):void
		// {
		// 	_text = value;
		// }

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

			// if(xml.children()[0]!=null){
			// 	this.text =unescape(xml.children()[0].toString());
			// }else{
			// 	this.text = unescape(xml.toString());
			// }

			this.color=xml.@color;
			this.size=xml.@size;
			this.fontStyle=xml.@style;
			
			this.formula=xml.@formula;
			this.hidewhen=xml.@hidewhen;
			
			

			
		}
		
		public function toCode():XML
		{
			
			//for domino input field element must contain into par node
			//var code_string:String=fixSpecailCharacter(this.text)
            var par_xml:XML = new XML("<par dominotype=\"computedtext\"/>");
			var xml:XML = new XML("<computedtext/>");
            if(this.formula==null||this.formula==""){
                this.formula=" "
            }
            
            var code_xml:XML = new XML("<code event=\"value\"/>");
            var formula_xml:XML=new XML("<formula>"+this.formula+"</formula>");
            code_xml.appendChild(formula_xml);
            xml.appendChild(code_xml);
			par_xml.appendChild(xml);



            return par_xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

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