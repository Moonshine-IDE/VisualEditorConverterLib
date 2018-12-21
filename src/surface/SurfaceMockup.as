package surface
{
	import interfaces.ISurface;
	import interfaces.IComponent;
	import interfaces.IVisualComponent;
	import utils.MainTagCodeUtils;
	import interfaces.IRootComponent;
	import interfaces.components.IDiv;

	public class SurfaceMockup implements ISurface, IVisualComponent, IComponent
	{
		private var _elements:Array;
	
		public function SurfaceMockup():void
		{
			_elements = [];	
		}		
		
		public function addItem(item:IComponent):void
		{
			
		}
		
		public function get numElements():int
		{
			if (_elements)
			{
				return _elements.length;	
			}	
			
			return 0;
		}		
		
		public function addElement(element:Object):void
		{
			_elements.push(element);		
		}
		
		public function getElementAt(index:int):Object
		{
			if (numElements > 0) 
			{
				return _elements[index]
			}
			
			return null;
		}
			
		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			throw new Error("Surface doesn't implement fromXML method!");
		}
		
		public function toCode():XML
		{
			var element:Object = this.getElementAt(0);
			var xml:XML = MainTagCodeUtils.getParentContent("", element as IDiv);
            var mainContainer:XML = MainTagCodeUtils.getMainContainerTag(xml);

			var elementCount:int = (element as IVisualComponent).numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IComponent = element.getElementAt(i) as IComponent;

                if (item === null)
                {
                        continue;
                }

			    XML.ignoreComments = false;
                var code:XML = item.toCode();
				var commentOnlyXML:XMLList = (code.elements("primeFacesCommentOnlyTag").length() > 0) ?
											  code.elements("primeFacesCommentOnlyTag") : null;
                if (mainContainer)
                {
                    mainContainer.appendChild(!commentOnlyXML ? code : commentOnlyXML.children());
                }
                else
                {
                    xml.appendChild(!commentOnlyXML ? code : commentOnlyXML.children());
                }
            }

			return xml;
		}
	}
}