package interfaces.components
{
    import interfaces.ICollapsiblePanel;
    import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IFieldset extends IComponent, IIsSelected, ICollapsiblePanel
	{
		function get toggleable():Boolean;
		function set toggleable(value:Boolean):void;
		
		function set title(value:String):void;
		function get title():String;
	}
}