package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IDataTable extends IComponent, IIsSelected
	{
		function set resizableColumns(value:Boolean):void;
		function get resizableColumns():Boolean;
		
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