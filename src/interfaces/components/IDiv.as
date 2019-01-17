package interfaces.components
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IDiv extends IComponent, IIsSelected
	{
		function get cssClass():String;
		function set cssClass(value:String):void;
		
		function get label():String;
		function set label(value:String):void;
		
		function get wrap():Boolean;
		function set wrap(value:Boolean):void;
	}
}