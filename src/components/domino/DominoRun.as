package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoRun;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	/** 
	 * Domino text element dxl format 
	*/
	public class DominoRun extends ComponentBase implements IDominoRun
	{
		public static const DOMINO_ELEMENT_NAME:String = "run";
        public static const ELEMENT_NAME:String = "run";
		
		public function DominoRun()
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
		
		private var _html:Boolean;
		public function get html():Boolean
		{
			return _html;
		}
		public function set html(value:Boolean):void
		{
			_html = value;
		}


		private var _highlight:String;
		public function get highlight():String
		{
			return _highlight;
		}
		public function set highlight(value:String):void
		{
			_highlight = value;
		}


		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			if(this.html){
				this.html = true;
			}else{
				this.html = false;
			}

			if(this.highlight){
				this.highlight = xml.@highlight;
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
		
			if (this.html)
            {
                xml.@html = "true";
            }else{
				xml.@html = "false";
			}

			if (this.highlight)
            {
                xml.@highlight = this.highlight;
            }

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{	
			return null;

		}


    }
}