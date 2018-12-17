package converter
{
	import interfaces.IComponent;
	import interfaces.ISurface;

	public class Converter  
	{
		private static var _instance:Converter;
		
		public var classLookup:Object;
		private var surface:ISurface;
		
		public function Converter(classLookup:Object = null)
		{
	        if(_instance)
			{
	            throw new Error("Use getInstance()");
	        } 
	        _instance = this;

			this.classLookup = classLookup;
	    }
	
	    public static function getInstance(classLookup:Object = null):Converter  
	    {
	        if(!_instance)
	        {
	            new Converter(classLookup);
	        } 
	        return _instance;
	    }
		
		public function fromXML(surface:ISurface, xml:XML):void
		{
			this.surface = surface;
			
			var elements:XMLList = xml.elements();
			var elementCount:int = elements.length();
			for(var i:int = 0; i < elementCount; i++)
			{
				var elementXML:XML = elements[i];
				itemFromXML(surface, elementXML);
			}
		}
		
		private function itemFromXML(parent:Object, itemXML:XML):IComponent
		{
			var name:String = itemXML.localName();
			if(!(name in this.classLookup))
			{
                    var elements:XMLList = itemXML.elements();
                    var elementCount:int = elements.length();
                    for(var i:int = 0; i < elementCount; i++)
                    {
                        var elementXML:XML = elements[i];
                        itemFromXML(parent, elementXML);
                    }
				return null;
			}
			var type:Class = this.classLookup[name];
			var item:IComponent = new type() as IComponent;
			if(item === null)
			{
				throw new Error("Failed to create surface component: " + name);
			}
			item.fromXML(itemXML, itemFromXML);
			parent.addElement(item);
			surface.addItem(item);
			return item;
		}
	}
}