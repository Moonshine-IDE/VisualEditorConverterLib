package interfaces.components
{
	import interfaces.IComponent;

	public interface IFieldset extends IComponent, IIsSelected, IPanel, ICollapsiblePanel
	{
		function get toggleable():Boolean;
		function set toggleable(value:Boolean):void;
	}
}