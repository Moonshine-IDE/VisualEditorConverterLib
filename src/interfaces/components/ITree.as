package interfaces.components
{
	import interfaces.IComponent;

	public interface ITree extends IComponent, IIsSelected
	{
		function get treeVar():String;
		function set treeVar(value:String):void;
		
		function get treeValue():String;
		function set treeValue(value:String):void;
	}
}