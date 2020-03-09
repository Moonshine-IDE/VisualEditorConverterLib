package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoColor;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	/** 
	 * Domino color element dxl format 
	*/
	public class DominoColor extends ComponentBase implements IDominoColor
	{

        public function DominoColor()
		{
			super();
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

    }
}