package interfaces.components
{
	import interfaces.IComponent;

	public interface IInputText extends IComponent, IIsSelected
	{
		function get text():String;
		function set text(value:String):void;
		
		function get maxLength():String;
		function set maxLength(value:String):void;
		
		function get idAttribute():String;
		function set idAttribute(value:String):void;
		
		function get required():Boolean;
		function set required(value:Boolean):void;
	}
}