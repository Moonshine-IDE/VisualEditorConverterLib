package interfaces.components
{
	import interfaces.IComponent;

	public interface IDataTable extends IComponent, IIsSelected, IDataGrid 
	{
		function get paginator():Boolean;
		function set paginator(value:Boolean):void;
			
		function get emptyMessage():String;
		function set emptyMessage(value:String):void;
		
		function get tableVar():String;
		function set tableVar(value:String):void;
		
		function get tableValue():String;
		function set tableValue(value:String):void;
	}
}