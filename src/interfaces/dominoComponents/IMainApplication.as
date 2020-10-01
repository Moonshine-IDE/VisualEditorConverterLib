package interfaces.dominoComponents
{
	import interfaces.IComponent;

	public interface IMainApplication extends IComponent
	{
		function get title():String;
        function set title(value:String):void;
	}
}