package interfaces.components
{
	public interface ITable
	{
		function get hasHeader():Boolean;
			
		function get headerRowCount():int;
		function set headerRowCount(value:int):void;
		
		function get columnCount():int;
		function set columnCount(value:int):void;
		
		function get headerRowTitles():Array;
		function set headerRowTitles(value:Array):void;
		
		function get rowCount():int;
		function set rowCount(value:int):void;
	}
}