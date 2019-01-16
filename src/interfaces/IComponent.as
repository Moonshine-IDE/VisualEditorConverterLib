package interfaces
{
	public interface IComponent 
	{
		function fromXML(xml:XML, childFromXMLCallback:Function):void;
		function toCode():XML;
	}
}