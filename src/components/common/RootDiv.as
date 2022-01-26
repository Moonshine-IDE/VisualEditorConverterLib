package components.common
{
	import interfaces.components.IRootDiv;
	import interfaces.IRootComponent;
	import interfaces.IComponent;
	
	public class RootDiv extends Div implements IRootDiv, IRootComponent
	{
		public function RootDiv(component:IComponent = null)
		{
			super(component);
		}
	}
}