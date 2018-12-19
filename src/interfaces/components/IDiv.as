package interfaces.components
{
	import interfaces.IComponent;

	public interface IDiv extends IComponent, IIsSelected
	{
		function get cssClass():String;
	}
}