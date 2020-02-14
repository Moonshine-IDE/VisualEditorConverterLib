package interfaces.dominoComponents
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IDominoInputText extends IComponent, IIsSelected
	{
		function get text():String;
		function set text(value:String):void;
		
		function get maxLength():String;
		function set maxLength(value:String):void;
		
		function get idAttribute():String;
		function set idAttribute(value:String):void;
		
		function get required():Boolean;
		function set required(value:Boolean):void;

		function get allowmultivalues():Boolean;
		function set allowmultivalues(value:Boolean):void;

		function get nameAttribute():String;
		function set nameAttribute(value:String):void;

		function get type():String;
		function set type(value:String):void;

		function get kind():String;
		function set kind(value:String):void;


		function get width():Number;
		function set width(value:Number):void;

		function get height():Number;
		function set height(value:Number):void;

	}
}