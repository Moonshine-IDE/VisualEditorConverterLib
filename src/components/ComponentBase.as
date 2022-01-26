package components
{
	import interfaces.IVisualComponent;

	public class ComponentBase implements IVisualComponent
	{
		private var _elements:Array;
		
		public function ComponentBase():void
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
		
		protected function setComponentSize(xml:XML):void
		{
			this.percentWidth = "@percentWidth" in xml ? xml.@percentWidth : Number.NaN;
			this.percentHeight = "@percentHeight" in xml ? xml.@percentHeight : Number.NaN;
			this.width = "@width" in xml ? xml.@width : Number.NaN;;
			this.height = "@height" in xml ? xml.@height : Number.NaN;;
		}
	}
}