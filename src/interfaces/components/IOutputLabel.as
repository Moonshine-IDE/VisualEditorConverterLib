package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IOutputLabel extends IComponent, IIsSelected
	{
		function get text():String;
		function set text(value:String):void;
		
        function get forAttribute():String;
		function set forAttribute(value:String):void;
		
		function get indicateRequired():Boolean;
		function set indicateRequired(value:Boolean):void;
		
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