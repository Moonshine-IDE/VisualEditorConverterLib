package interfaces
{
	public interface IComponent 
	{
		function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void;
		function toCode():XML;
	}
}