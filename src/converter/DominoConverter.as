package converter
{
    import flash.events.EventDispatcher;
    
   

    import events.ConverterErrorEvent;
	import events.ConverterEvent;
	
	import interfaces.IComponent;
	import interfaces.ISurface;
	
	import surface.SurfaceMockup;
	import components.Container;
	import components.GridRow;
	import components.GridItem;
	import components.NavigatorContent;

    import components.domino.Body;
    import components.domino.DominoInputText;

    [Event(name="conversionCompleted", type="events.ConverterEvent")]
	public class DominoConverter extends EventDispatcher
	{
		private static var _instance:DominoConverter;
		
		public var classLookup:Object;
		private var componentsSurface:ISurface;
		
		private var unknownItemsExceptions:Array;
		
		public function DominoConverter(classLookup:Object = null)
		{
	        if(_instance)
			{
	            throw new Error("Use getInstance()");
	        } 
	        _instance = this;

			fillClassLookupWidthData(classLookup);
						
			this.unknownItemsExceptions = [
				"Column"
			];
	    }
	
		public function getNewInstanceOfComponent(name:String):IComponent
		{
			if ((name in this.classLookup))
			{
				var type:Class = this.classLookup[name];
				return new type() as IComponent;
			}

			return null;						
	    }		
	
	    public static function getInstance(classLookup:Object = null):DominoConverter  
	    {
	        if(!_instance)
	        {
	            new DominoConverter(classLookup);
	        } 

	        return _instance;
	    }

		public function fromXMLOnly(xml:XML):void
		{	
			var surfaceMockup:SurfaceMockup = new SurfaceMockup();

			this.fromXML(surfaceMockup, xml);
			
			var code:XML = surfaceMockup.toDominoCode();
			this.dispatchEvent(new ConverterEvent(ConverterEvent.CONVERSION_COMPLETED, code));
		}		
		
		public function fromXML(surface:ISurface, xml:XML):void
		{
			this.componentsSurface = surface;
			
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
				if (!this.unknownItemsExceptions.some(function(itemName:String, index:int, arr:Array):Boolean {
						return itemName == name;
					}))
				{				
					dispatchEvent(new ConverterEvent(ConverterEvent.UNKNOWN_CONVERSION_ITEM, null, name));
				}
				
                var elements:XMLList = itemXML.elements();
                var elementCount:int = elements.length();
                for(var i:int = 0; i < elementCount; i++)
                {
                   var elementXML:XML = elements[i];
                   this.itemFromXML(parent, elementXML);
                }
				return null;
			}

			var item:IComponent = getNewInstanceOfComponent(name);
			if(item === null)
			{
				var errorMessage:String = "Failed to create surface component: " + name;
				dispatchEvent(new ConverterErrorEvent(errorMessage));
				throw new Error(errorMessage);
			}
			item.fromXML(itemXML, this.itemFromXML);
			parent.addElement(item);
			componentsSurface.addItem(item);
			return item;
		}
		
		private function fillClassLookupWidthData(classLookup:Object):void
		{
			if (classLookup)
			{
				this.classLookup = classLookup;
				return;
			}
			
			this.classLookup = {};
            /**
             * For let the xml format can work with old code 
             * we need setting the root as domino body .
             */
            this.classLookup["RootDiv"] = Body;
			this.classLookup["MainApplication"] = Body;
			
			this.classLookup["Body"] = Body;

            
			this.classLookup[DominoInputText.ELEMENT_NAME] = DominoInputText;
			
		}
	}
}