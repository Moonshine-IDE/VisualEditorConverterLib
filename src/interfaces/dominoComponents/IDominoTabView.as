package interfaces.dominoComponents
{
	import interfaces.IDominoComponent;
    import interfaces.IIsSelected;

    public interface IDominoTabView extends IDominoComponent, IIsSelected
	{
		function get orientation():String;
		function set orientation(value:String):void;
		
		function get scrollable():Boolean;
		function set scrollable(value:Boolean):void;
		
		function get selectedIndex():int;
		function set selectedIndex(value:int):void;
	}
}