
package converter
{
	import flash.events.EventDispatcher;

	import events.ConverterErrorEvent;
	import events.ConverterEvent;
	
	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.ISurface;

	import surface.PrimeFacesLookup;

	import surface.SurfaceMockup;

	[Event(name="conversionCompleted", type="events.ConverterEvent")]
	public class PrimeFacesConverter extends EventDispatcher
	{
		private static var _instance:PrimeFacesConverter;
		
		public var classLookup:ILookup;

		private var unknownItemsExceptions:Array;
		
		public function PrimeFacesConverter(classLookup:ILookup = null)
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
			if ((name in this.classLookup.lookup))
			{
				var type:Class = this.classLookup.lookup[name];
				return new type() as IComponent;
			}

			return null;						
	    }		
	
	    public static function getInstance(classLookup:ILookup = null):PrimeFacesConverter
	    {
	        if(!_instance)
	        {
	            new PrimeFacesConverter(classLookup);
	        } 

	        return _instance;
	    }

		public function fromXMLOnly(xml:XML):void
		{	
			var surfaceMockup:SurfaceMockup = new SurfaceMockup();
			this.fromXML(surfaceMockup, xml);

			var code:XML = surfaceMockup.toCode();
			this.dispatchEvent(new ConverterEvent(ConverterEvent.CONVERSION_COMPLETED, code));
		}		
		
		public function fromXML(surface:ISurface, xml:XML):void
		{
			var elements:XMLList = xml.elements();
			var elementCount:int = elements.length();
			var localSurface:ISurface = surface;
			for(var i:int = 0; i < elementCount; i++)
			{
				var elementXML:XML = elements[i];
				var component:IComponent = itemFromXML(surface, elementXML);
				localSurface.addItem(component);
			}
		}
		
		private function itemFromXML(parent:Object, itemXML:XML):IComponent
		{
			var name:String = itemXML.localName();
			if(!(name in this.classLookup.lookup))
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

			return item;
		}
		
		private function fillClassLookupWidthData(classLookup:ILookup):void
		{
			if (classLookup)
			{
				this.classLookup = classLookup;
				return;
			}

			this.classLookup = new PrimeFacesLookup();

			/*this.classLookup["RootDiv"] = RootDiv;
			this.classLookup["MainApplication"] = MainApplication;
			this.classLookup[Container.ELEMENT_NAME] = Container;
			this.classLookup[GridRow.GRIDROW_NAME] = GridRow;
			this.classLookup[GridItem.GRIDITEM_NAME] = GridItem;
			this.classLookup[NavigatorContent.NAVIGATORCONTENT_NAME] = NavigatorContent;

			this.classLookup[Div.ELEMENT_NAME] = Div;
			this.classLookup[TabView.ELEMENT_NAME] = TabView;
			this.classLookup[PanelGrid.ELEMENT_NAME] = PanelGrid;
			this.classLookup[Grid.ELEMENT_NAME] = Grid;
			this.classLookup[Include.ELEMENT_NAME] = Include;
			this.classLookup[Button.ELEMENT_NAME] = Button;
			this.classLookup[OutputLabel.ELEMENT_NAME] = OutputLabel;
			this.classLookup[InputText.ELEMENT_NAME] = InputText;
			this.classLookup[DataTable.ELEMENT_NAME] = DataTable;
			this.classLookup[Fieldset.ELEMENT_NAME] = Fieldset;
			this.classLookup[SelectOneMenu.ELEMENT_NAME] = SelectOneMenu;
			this.classLookup[TextEditor.ELEMENT_NAME] = TextEditor;
			this.classLookup[InputTextarea.ELEMENT_NAME] = InputTextarea;
			this.classLookup[Calendar.ELEMENT_NAME] = Calendar;
			this.classLookup[SelectBooleanCheckbox.ELEMENT_NAME] = SelectBooleanCheckbox;
			this.classLookup[SelectOneRadio.ELEMENT_NAME] = SelectOneRadio;
			this.classLookup[InputMask.ELEMENT_NAME] = InputMask;
			this.classLookup[InputNumber.ELEMENT_NAME] = InputNumber;
			this.classLookup[Tree.ELEMENT_NAME] = Tree;
			this.classLookup[AutoCompleteDropDownList.ELEMENT_NAME] = AutoCompleteDropDownList;
			this.classLookup[SelectOneListbox.ELEMENT_NAME] = SelectOneListbox;*/
		}
	}
}