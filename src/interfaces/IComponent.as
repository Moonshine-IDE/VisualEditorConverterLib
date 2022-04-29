package interfaces
{
	public interface IComponent 
	{
		function fromXML(xmlNode:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void;
		function toCode():XML;
	}
}