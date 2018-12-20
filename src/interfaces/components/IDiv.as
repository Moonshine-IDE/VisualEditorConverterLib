package interfaces.components
{
	import interfaces.IComponent;

	public interface IDiv extends IComponent, IIsSelected
	{
		function get cssClass():String;
		
		function get label():String;
		function set label(value:String):void;
	}
}