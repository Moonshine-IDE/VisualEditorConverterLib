package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IInclude extends IComponent, IIsSelected
	{
		function get path():String;
		function set path(value:String):void;
		
		function get width():Number;
		function set width(value:Number):void;
		
		function get height():Number;
		function set height(value:Number):void;
		
		function get percentWidth():Number;
		function set percentWidth(value:Number):void;
		
		function get percentHeight():Number;
		function set percentHeight(value:Number):void;
		
	}
}