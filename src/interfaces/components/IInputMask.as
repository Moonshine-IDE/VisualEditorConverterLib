package interfaces.components
{
	import interfaces.IComponent;

	public interface IInputMask extends IComponent, IIsSelected
	{
		function get maskText():String;
		function set maskText(value:String):void;
		
		function get text():String;
		function set text(value:String):void;
		
		function get idAttribute():String;
		function set idAttribute(value:String):void;
		
		function get required():Boolean;
		function set required(value:Boolean):void;
	}
}