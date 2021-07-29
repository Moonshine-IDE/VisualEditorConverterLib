package interfaces.dominoComponents
{
	import interfaces.IComponent;
    import interfaces.IIsSelected;

    public interface IDominoButton extends IComponent, IIsSelected
	{
		function get label():String;
		function set label(value:String):void;	

		function get enabled():Boolean;
		function set enabled(value:Boolean):void;	
		

	}
}