package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IInputNumber extends IComponent, IIsSelected
	{
		function get thousandSeparator():String;
		function set thousandSeparator(value:String):void;
		
		function get decimalSeparator():String;
		function set decimalSeparator(value:String):void;
		
		function get text():String;
		function set text(value:String):void;
		
		function get idAttribute():String;
		function set idAttribute(value:String):void;
		
		function get required():Boolean;
		function set required(value:Boolean):void;
	}
}