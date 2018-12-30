package interfaces.components
{
	import interfaces.IComponent;

	public interface IAutoCompleteDropDownList extends IComponent
	{
		function get value():String;
		function set value(value:String):void;

		function get fieldVar():String;
		function set fieldVar(value:String):void;
		
		function get multiple():Boolean;
		function set multiple(value:Boolean):void;
		
		function get completeMethod():String;
		function set completeMethod(value:String):void;
		
		function get itemLabel():String;
		function set itemLabel(value:String):void;
		
		function get itemValue():String;
		function set itemValue(value:String):void;
		
		function get converter():String;
		function set converter(value:String):void;
		
		function get isDropDown():Boolean;
	}
}