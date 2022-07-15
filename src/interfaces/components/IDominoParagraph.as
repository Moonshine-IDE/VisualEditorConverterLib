package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IDominoParagraph extends IComponent, IIsSelected
	{
		
		function get wrap():Boolean;
		function set wrap(value:Boolean):void;
		function get cssClass():String;

		function get isNewLine():String
        function set isNewLine(value:String):void;

		function get leftmargin():String
        function set leftmargin(value:String):void;

		function get firstlineleftmargin():String
        function set firstlineleftmargin(value:String):void;

	}
}