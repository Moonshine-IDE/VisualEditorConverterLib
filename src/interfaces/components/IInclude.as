package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IInclude extends IComponent, IIsSelected
	{
		function get path():String;
		function set path(value:String):void;
	}
}