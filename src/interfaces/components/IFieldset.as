package interfaces.components
{
	import interfaces.IComponent;

	public interface IFieldset extends IComponent, IIsSelected, ICollapsiblePanel
	{
		function get toggleable():Boolean;
		function set toggleable(value:Boolean):void;
		
		function set title(value:String):void;
		function get title():String;
	}
}