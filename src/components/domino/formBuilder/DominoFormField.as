package components.domino.formBuilder
{
	import components.domino.DominoInputText;
	
	import utils.DominoFieldTemplatesManager;
	
	public class DominoFormField extends DominoInputText
	{
		public var formula:String = "";
		
		public function DominoFormField()
		{
			super();
		}
		
		override public function toCode():XML
		{
			var xml:XML = <par/>;
			
			var templateString:String = DominoFieldTemplatesManager.getTemplate(type, allowmultivalues, kind);
			if (templateString)
			{
				templateString = templateString.replace("%FieldName%", nameAttribute);
				templateString = templateString.replace("%ComputedValue%", formula);
				
				xml.appendChild(new XML(templateString));
			}
			
			return xml;
		}
	}
}