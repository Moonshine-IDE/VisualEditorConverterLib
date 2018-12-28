package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface ISelectOneListbox extends IComponent, IIsSelected
	{
		function get value():String;
		function set value(value:String):void;
		
		function get dataProvider():Array;
		function set dataProvider(value:Array):void;
	}
}