    package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoTableCell;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;
    import components.enum.ColorName;

	/** 
	 * Domino text element dxl format 
	*/
	public class DominoTableCell extends ComponentBase implements IDominoTableCell
	{
        
        public function DominoTableCell()
		{
			super();
		}
        
        private var _bgcolor:ColorName;
		public function get bgcolor():ColorName
		{
			return _bgcolor;
		}
		public function set bgcolor(value:ColorName):void
		{
			_bgcolor = value;
		}

        private var _rowspan:Number;
		public function get rowspan():Number
		{
			return _rowspan;
		}
		public function set rowspan(value:Number):void
		{
			_rowspan = value;
		}


        private var _columnspan:Number;
        public function get columnspan():Number
		{
			return _columnspan;
		}
		public function set columnspan(value:Number):void
		{
			_columnspan = value;
		}

        private var _colorstyle:Number;
        public function get colorstyle():Number
		{
			return _colorstyle;
		}
		public function set colorstyle(value:Number):void
		{
			_colorstyle = value;
		}


        public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
		}

		public function toCode():XML
		{
			  var xml:XML = new XML("<tablerow/>");

			  return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}
    }
}