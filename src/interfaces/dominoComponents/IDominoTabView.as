package interfaces.dominoComponents
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;
	import interfaces.IDominoVisualHideOption;

    public interface IDominoTabView extends IComponent, IIsSelected
	{
		function get orientation():String;
		function set orientation(value:String):void;
		
		function get scrollable():Boolean;
		function set scrollable(value:Boolean):void;
		
		function get selectedIndex():int;
		function set selectedIndex(value:int):void;
	}
}