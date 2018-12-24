package interfaces.components
{
	import interfaces.IComponent;

	public interface ITextEditor extends IComponent, IIsSelected 
	{
		function set widgetVar(value:String):void;
		function get widgetVar():String;
		
		function set text(value:String):void;
		function get text():String;
		
		function set placeholder(value:String):void;
		function get placeholder():String;
		
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