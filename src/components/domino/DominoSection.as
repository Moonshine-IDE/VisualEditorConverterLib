package components.domino
{
    import components.ComponentBase;

	import interfaces.dominoComponents.IDominoSection;
    import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

    public class DominoSection extends ComponentBase implements IDominoSection
	{
		public static const DOMINO_ELEMENT_NAME:String = "section";
        public static const ELEMENT_NAME:String = "Section";
        
		public function DominoSection()
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
		private var _title:String;
		public function set title(t:String):void
		{
			_title = t;
		}
		public function get title():String
		{
			return _title ;
		}

		
		


        public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

		
			

			this.title=xml.@title;
		
			

			
		}
		
		public function toCode():XML
		{
			
			//for domino input field element must contain into par node
			//var code_string:String=fixSpecailCharacter(this.text)
			var section_xml:XML = new XML("<section/>");
           
			var section_title_xml:XML =  new XML("<sectiontitle/>");
				if(this.title){
					section_title_xml.@title=this.title;
				}

				
            return section_xml;
		}

		
    }
}