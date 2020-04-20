package interfaces
{
	import flash.filesystem.File;

	public interface IConverterLibraryBridge
	{
		function read(file:File):String;
		function readAsync(file:File, onSuccess:Function, onFault:Function=null):void;
		function getDominoFieldTemplateFile(path:String):File;
	}
}