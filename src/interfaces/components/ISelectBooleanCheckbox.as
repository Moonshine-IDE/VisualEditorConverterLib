package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface ISelectBooleanCheckbox extends IComponent, IIsSelected
	{
		function get label():String;
		function set label(value:String):void;
		
		function get selected():Boolean;
		function set selected(value:Boolean):void;
	}
}