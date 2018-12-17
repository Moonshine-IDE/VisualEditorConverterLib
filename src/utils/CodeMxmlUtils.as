package utils
{
	public class CodeMxmlUtils  
	{
		public static function getMXMLTagNameWithSelection(component:Object, rootElementName:String):String
		{
			return (component.isSelected ? ""+ rootElementName : rootElementName);
		}
	}
}