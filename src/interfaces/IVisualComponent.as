package interfaces
{
    
	public interface IVisualComponent 
	{
		function addElement(element:Object):void;	
		function getElementAt(index:int):Object;
		function get numElements():int;
	}
}