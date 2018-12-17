package interfaces.components
{
	import interfaces.IComponent;

	public interface IButton extends IComponent
	{
		function get label():String;
		function set label(value:String):void;
		
		function get enabled():Boolean;
		function set enabled(value:Boolean):void;
		
		function get isCommandButton():Boolean;
		function set isCommandButton(value:Boolean):void;
		
        function get toolTip():String;
		function set toolTip(value:String):void;
		
		function get actionListener():String;
		function set actionListener(value:String):void;
		
		function get isSelected():Boolean;
		function set isSelected(value:Boolean):void;
		
		function get width():Number;
		function set width(value:Number):void;
		
		function get height():Number;
		function set height(value:Number):void;
		
		function get percentWidth():Number;
		function set percentWidth(value:Number):void;
		
		function get percentHeight():Number;
		function set percentHeight(value:Number):void;
		
	}
}