package interfaces.components
{
	import interfaces.IComponent;

	public interface IPanelGrid extends IComponent, IIsSelected 
	{
		function get cdataXML():XML;
		function get cdataInformation():String;
		
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