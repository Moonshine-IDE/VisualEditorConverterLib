package surface
{
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.IComponent;
	import interfaces.IVisualComponent;
	import utils.MainTagCodeUtils;
	import interfaces.components.IDiv;


	public class SurfaceMockup implements ISurface, IVisualComponent, IComponent
	{
		private var _elements:Array;
	
		public function SurfaceMockup():void
		{
			_elements = [];	
		}		
		
		private var _width:Number;
		public function get width():Number
		{
			return _width;
		}

		public function set width(value:Number):void
		{
			_width = value;
		}
		
		private var _height:Number;
		public function get height():Number
		{
			return _height;
		}

		public function set height(value:Number):void
		{
			_height = value;
		}
		
		private var _percentWidth:Number;
		public function get percentWidth():Number
		{
			return _percentWidth;
		}

		public function set percentWidth(value:Number):void
		{
			_percentWidth = value;
		}
		
		private var _percentHeight:Number;
		public function get percentHeight():Number
		{
			return _percentHeight;
		}

		public function set percentHeight(value:Number):void
		{
			_percentHeight = value;
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
			
		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
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


		public function toRoyaleConvertCode():XML
		{
			var element:Object = this.getElementAt(0);
			var xml:XML = MainTagCodeUtils.getRoyaleViewParentContent(element as IComponent);

			var elementCount:int = (element as IVisualComponent).numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IRoyaleComponentConverter = element.getElementAt(i) as IRoyaleComponentConverter;

                if (item === null)
                {
					continue;
                }

			    XML.ignoreComments = false;
                var code:XML = (item as IRoyaleComponentConverter).toRoyaleConvertCode();
				xml.appendChild(code);
            }

			return xml;
		}

		public function toDominoCode(mainContainer:XML):XML
		{
			
			var elementCount:int = this.numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IComponent = this.getElementAt(i) as IComponent;

                if (item === null)
                {
                        continue;
                }

			    XML.ignoreComments = false;
                var code:XML = item.toCode();
				var name:String = code.localName();
				
                 mainContainer.appendChild(code);
            }

			return mainContainer;
		}

		
	}
}