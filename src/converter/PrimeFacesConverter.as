
package converter
{
	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.ISurface;

	import surface.SurfaceMockup;

	public class PrimeFacesConverter
	{
		//private var unknownItemsExceptions:Array;

		public static function fromXMLOnly(lookup:ILookup, xml:XML):void
		{	
			var surfaceMockup:SurfaceMockup = new SurfaceMockup();
			fromXML(surfaceMockup, lookup, xml);

			//var code:XML = surfaceMockup.toCode();
			//this.dispatchEvent(new ConverterEvent(ConverterEvent.CONVERSION_COMPLETED, code));
		}		
		
		public static function fromXML(surface:ISurface, lookup:ILookup, xml:XML):void
		{
			var localSurface:ISurface = surface;
			var elements:XMLList = xml.elements();
			var elementCount:int = elements.length();

			for(var i:int = 0; i < elementCount; i++)
			{
				var elementXML:XML = elements[i];
				var component:IComponent = itemFromXML(localSurface, lookup, elementXML, localSurface);
				localSurface.addItem(component);
			}
		}
		
		private static function itemFromXML(parent:Object, lookup:ILookup, itemXML:XML, surface:ISurface):IComponent
		{
			var localSurface:ISurface = surface;
			var name:String = itemXML.localName();
			if(!(name in lookup.lookup))
			{
				/*if (!this.unknownItemsExceptions.some(function(itemName:String, index:int, arr:Array):Boolean {
						return itemName == name;
					}))
				{				
					dispatchEvent(new ConverterEvent(ConverterEvent.UNKNOWN_CONVERSION_ITEM, null, name));
				}*/
				
                var elements:XMLList = itemXML.elements();
                var elementCount:int = elements.length();
                for(var i:int = 0; i < elementCount; i++)
                {
                   var elementXML:XML = elements[i];
                   itemFromXML(parent, lookup, elementXML, localSurface);
                }
				return null;
			}

			var item:IComponent = getNewInstanceOfComponent(lookup, name);
			if(item === null)
			{
				var errorMessage:String = "Failed to create surface component: " + name;
				//dispatchEvent(new ConverterErrorEvent(errorMessage));
				throw new Error(errorMessage);
			}
			item.fromXML(itemXML, itemFromXML, localSurface, lookup);
			parent.addElement(item);
			localSurface.addItem(item);

			return item;
		}

		public static function getNewInstanceOfComponent(lookup:ILookup, name:String):IComponent
		{
			if ((name in lookup.lookup))
			{
				var type:Class = lookup.lookup[name];
				return new type() as IComponent;
			}

			return null;
		}
	}
}