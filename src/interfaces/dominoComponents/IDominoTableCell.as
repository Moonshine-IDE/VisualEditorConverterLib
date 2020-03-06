package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import components.enum.ColorName;

    /**
     * Domino table cell dxl format ,more detail please view follow url
     * https://www.ibm.com/support/knowledgecenter/en/SSVRGU_9.0.1/basic/H_TABLECELL_ELEMENT_XML.html
     * Contained by: <tablerow>
     * Contains: <cellbackground>, %richtext.block;
     */

    public interface IDominoTableCell  extends IComponent
    {  

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
		public function get rowspan():ColorName
		{
			return _rowspan;
		}
		public function set rowspan(value:Number):void
		{
			_bgcolor = value;
		}


        private var _columnspan:Number;
        public function get columnspan():ColorName
		{
			return _columnspan;
		}
		public function set columnspan(value:Number):void
		{
			_columnspan = value;
		}

        private var _colorstyle:Number;
        public function get colorstyle():ColorName
		{
			return _colorstyle;
		}
		public function set colorstyle(value:Number):void
		{
			_colorstyle = value;
		}

        

        
  
    }
}
