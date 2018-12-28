package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface ITabView extends IComponent, IIsSelected
	{
		function get orientation():String;
		function set orientation(value:String):void;
		
		function get scrollable():Boolean;
		function set scrollable(value:Boolean):void;
	}
}