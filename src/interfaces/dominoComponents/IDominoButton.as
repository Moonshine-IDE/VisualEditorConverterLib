package interfaces.dominoComponents
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;
	import interfaces.IDominoVisualHideOption;

    public interface IDominoButton extends IDominoVisualHideOption,IComponent, IIsSelected
	{
		function get label():String;
		function set label(value:String):void;	

		function get enabled():Boolean;
		function set enabled(value:Boolean):void;	

		function get size():String;
		function set size(value:String):void;	

		function get color():String;
		function set color(value:String):void;	

		function get fontStyle():String;
		function set fontStyle(value:String):void;


		function get code():String;
		function set code(value:String):void;	

		function get codeEvent():String;
		function set codeEvent(value:String):void;		


		

	}
}