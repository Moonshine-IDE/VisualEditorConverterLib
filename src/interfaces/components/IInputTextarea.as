package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IInputTextarea extends IComponent, IIsSelected
	{
		function get text():String;
		function set text(value:String):void;
		
		function get maxLength():String;
		function set maxLength(value:String):void;
		
		function get idAttribute():String;
		function set idAttribute(value:String):void;
		
		function get required():Boolean;
		function set required(value:Boolean):void;
		
		function get isAutoResize():Boolean;
		function set isAutoResize(value:Boolean):void;
		
		function get isCounterDisplay():Boolean;
		function set isCounterDisplay(value:Boolean):void;
		
		function get counterTemplate():String;
		function set counterTemplate(value:String):void;
		
		function get counter():String;
		function set counter(value:String):void
	}
}