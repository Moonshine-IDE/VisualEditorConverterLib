package utils
{
	import flash.filesystem.File;

	public class DominoFieldTemplatesManager
	{
		public static function getTemplate(type:String, multivalue:Boolean, editable:String):String
		{
			var fileName:String = "field_"+ type.toLowerCase() +"_";
			fileName += (multivalue ? "m" : "s") +"_";
			switch(editable)
			{
				case "Editable":
					fileName += "e";
					break;
				case "Computed":
					fileName += "c";
					break;
				case "Compute on compose":
					fileName += "cwc";
					break;
				case "Compute for display":
					fileName += "cfd";
					break;
			}
			
			// since we have file-access problem within library project
			// we'll request the file available in main application sandbox
			var templateFile:File = ConverterUtils.converterToVisualEditorBridge.getDominoFieldTemplateFile(fileName +".dxl");
			if (templateFile.exists)
			{
				return ConverterUtils.converterToVisualEditorBridge.read(templateFile);
			}
			
			return null;
		}
	}
}