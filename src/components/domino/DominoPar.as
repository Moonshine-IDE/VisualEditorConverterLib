package components.domino
{
	import components.ComponentBase;

	import interfaces.dominoComponents.IDominoPar;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	/** 
	 * Domino text element dxl format 
	*/
	public class DominoPar extends ComponentBase implements IDominoPar
	{
		public static const DOMINO_ELEMENT_NAME:String = "par";
        public static const ELEMENT_NAME:String = "par";

		public function DominoPar()
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
		
		private var _def:String;
		public function get def():String
		{
			return _def;
		}
		public function set def(value:String):void
		{
			_def = value;
		}


		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			if(this.def){
				this.def = xml.@def;
			}
		
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
		
			if (this.def)
            {
                xml.@def = this.def;
            }

			return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}
    }
}