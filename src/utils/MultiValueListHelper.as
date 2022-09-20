package utils
{
	public class MultiValueListHelper
	{
		public static function getListType(dominoType:String):String
        {
            switch(dominoType)
            {
                case "richtext":
                        return "Richtext";
                    break;
                case "number":
                        return "Number";
                    break;
                case "date":
                        return "Datetime";
                    break;
                default:
                        return "Text";
                    break;
            }
        }
	}
}
