package components.domino
{
	import components.ComponentBase;

    import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

    import interfaces.dominoComponents.IDominoTableRow;

    import components.enum.CellBackgroundRepeat;

    /** 
	 * Domino table element dxl format 
	*/
	public class DominoTableRow extends ComponentBase implements IDominoTableRow
	{
        
		public function DominoTableRow()
		{
			super();
		}
        
		
		private var _tablabel:String;
		public function get tablabel():String
		{
			return _tablabel;
		}
		public function set tablabel(value:String):void
		{
			_tablabel = value;
		}


        private var _name:String;
		public function get name():String
		{
			return _name;
		}
		public function set name(value:String):void
		{
			_name = value;
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

    }

}