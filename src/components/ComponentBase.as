package components
{
    
	public class ComponentBase  
	{
		private var _width:Number;
		private function get width():Number
		{
			return _width;
		}

		private function set width(value:Number):void
		{
			_width = value;
		}
		
		private var _height:Number;
		private function get height():Number
		{
			return _height;
		}

		private function set height(value:Number):void
		{
			_height = value;
		}
		
		private var _percentWidth:Number;
		private function get percentWidth():Number
		{
			return _percentWidth;
		}

		private function set percentWidth(value:Number):void
		{
			_percentWidth = value;
		}
		
		private var _percentHeight:Number;
		private function get percentHeight():Number
		{
			return _percentHeight;
		}

		private function set percentHeight(value:Number):void
		{
			_percentHeight = value;
		}
		
	}
}