package interfaces.components
{
	import interfaces.IComponent;

	public interface ICalendar extends IComponent, IIsSelected
	{
		function get pattern():String;
		function set pattern(value:String):void;
		
		function get selectedDate():String;
		function set selectedDate(value:String):void;
		
		function get minDate():String;
		function set minDate(value:String):void;
		
		function get maxDate():String;
		function set maxDate(value:String):void;
		
		function get mode():String;
		function set mode(value:String):void;
	}
}