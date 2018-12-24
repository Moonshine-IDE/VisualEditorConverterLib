package interfaces.components
{
	import interfaces.IComponent;

	public interface ISelectOneMenu extends IComponent, IIsSelected
	{
		function get value():String;
		function set value(value:String):void;
		
		function get editable():Boolean;
		function set editable(value:Boolean):void;
		
		function set dataProvider(value:Array):void;
		function get dataProvider():Array;
	}
}