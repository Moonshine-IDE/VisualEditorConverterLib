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
	public class DominoTable extends ComponentBase implements IDominoTable
	{
        public static const DOMINO_ELEMENT_NAME:String = "table";
        public static const ELEMENT_NAME:String = "table";
		
        public function DominoTable()
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



		private var _minrowheight:String;
		public function get minrowheight():String
		{
			return _minrowheight;
		}
		public function set minrowheight(value:String):void
		{
			_minrowheight = value;
		}



		private var _rowspacing:String;
		public function get rowspacing():String
		{
			return _rowspacing;
		}
		public function set rowspacing(value:String):void
		{
			_rowspacing = value;
		}

        private var _columnspacing:String;
		public function get columnspacing():String
		{
			return _columnspacing;
		}
		public function set columnspacing(value:String):void
		{
			_columnspacing = value;
		}


        private var _cellborderstyle:String;
		public function get cellborderstyle():String
		{
			return _cellborderstyle;
		}
		public function set cellborderstyle(value:String):void
		{
			_cellborderstyle = value;
		}

        private var _colorstyle:String;
		public function get colorstyle():String
		{
			return _colorstyle;
		}
		public function set colorstyle(value:String):void
		{
			_colorstyle = value;
		}


        private var _bgcolor:String;
		public function get bgcolor():String
		{
			return _bgcolor;
		}
		public function set bgcolor(value:String):void
		{
			_bgcolor = value;
		}

        private var _altbgcolor:String;
		public function get altbgcolor():String
		{
			return _altbgcolor;
		}
		public function set altbgcolor(value:String):void
		{
			_altbgcolor = value;
		}


        private var _leftmargin:String;
		public function get leftmargin():String
		{
			return _leftmargin;
		}
		public function set leftmargin(value:String):void
		{
			_leftmargin = value;
		}

        private var _rightmargin:String;
		public function get rightmargin():String
		{
			return _rightmargin;
		}
		public function set rightmargin(value:String):void
		{
			_rightmargin = value;
		}


        private var _r4spacing:String;
		public function get r4spacing():String
		{
			return _r4spacing;
		}
		public function set r4spacing(value:String):void
		{
			_r4spacing = value;
		}

        private var _rowdisplay:String;
		public function get rowdisplay():String
		{
			return _rowdisplay;
		}
		public function set rowdisplay(value:String):void
		{
			_rowdisplay = value;
		}


        private var _rowtimer:String;
		public function get rowtimer():String
		{
			return _rowtimer;
		}
		public function set rowtimer(value:String):void
		{
			_rowtimer = value;
		}

        private var _sizetabsequally:String;
		public function get sizetabsequally():String
		{
			return _sizetabsequally;
		}
		public function set sizetabsequally(value:String):void
		{
			_sizetabsequally = value;
		}

        private var _tablocation:String;
		public function get tablocation():String
		{
			return _tablocation;
		}
		public function set tablocation(value:String):void
		{
			_tablocation = value;
		}

        private var _outsidewrap:String;
		public function get outsidewrap():String
		{
			return _outsidewrap;
		}
		public function set outsidewrap(value:String):void
		{
			_outsidewrap = value;
		}

        private var _insidewrap:String;
		public function get insidewrap():String
		{
			return _insidewrap;
		}
		public function set insidewrap(value:String):void
		{
			_insidewrap = value;
		}

        private var _insidewrapheight:String;
		public function get insidewrapheight():String
		{
			return _insidewrapheight;
		}
		public function set insidewrapheight(value:String):void
		{
			_insidewrapheight = value;
		}

        public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
        }

        public function toCode():XML
		{
            var table_xml:XML = new XML("<table/>");

            return table_xml;
        }


    }
}