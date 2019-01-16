package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface ITextEditor extends IComponent, IIsSelected
	{
		function set widgetVar(value:String):void;
		function get widgetVar():String;
		
		function set text(value:String):void;
		function get text():String;
		
		function set placeholder(value:String):void;
		function get placeholder():String;
	}
}