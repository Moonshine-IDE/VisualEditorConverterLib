package interfaces
{
	public interface IComponent 
	{
		function fromXML(xml:XML, childFromXMLCallback:Function):void;
		function toCode():XML;
		
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