////////////////////////////////////////////////////////////////////////////////
// Copyright 2022 Prominic.NET, Inc.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and 
// limitations under the License
// 
// Author: Prominic.NET, Inc.
// No warranty of merchantability or fitness of any kind. 
// Use this software at your own risk.
////////////////////////////////////////////////////////////////////////////////
package converter
{
    import flash.events.EventDispatcher;
    
   

    import events.ConverterErrorEvent;
	import events.ConverterEvent;
	
	import interfaces.IComponent;
	import interfaces.IDominoComponent;
	import interfaces.ISurface;
	
	import surface.SurfaceMockup;
	import components.Container;
	import components.GridRow;
	import components.GridItem;
	import components.NavigatorContent;

    import components.domino.Body;
    import components.domino.DominoInputText;
	import components.domino.DominoTable;
	import components.domino.DominoLabel;
	import components.domino.DominoSection;
	import components.domino.DominoTabView;
	import components.domino.DominoCalendar;
	import components.DominoRow;

	import components.GridItem;
	import components.common.Div;

	import mx.controls.Alert;
	import components.NavigatorContent;
	// import view.primeFaces.supportClasses.Container;
	// import view.primeFaces.supportClasses.GridRow;

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

		public function getNewInstanceOfDominoComponent(name:String):IDominoComponent
		{
			if ((name in this.classLookup))
			{
				var type:Class = this.classLookup[name];
				return new type() as IDominoComponent;
			}

			return null;						
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


		public function fromXMLAutoConvert(xml:XML):SurfaceMockup
		{	
			var surfaceMockup:SurfaceMockup = new SurfaceMockup();
			//this.componentsSurface = surfaceMockup;
			this.fromXML(surfaceMockup, xml);
			
			//var code:XML = surfaceMockup.toDominoCode();
			return surfaceMockup;
		}	
		
		public function fromXML(surface:ISurface, xml:XML):void
		{
		
			if(xml!=null){
				this.componentsSurface = surface;
				
				var elements:XMLList = xml.elements();
				if(elements!=null){
					var elementCount:int = elements.length();
			
					for(var i:int = 0; i < elementCount; i++)
					{
						var elementXML:XML = elements[i];
					
						itemFromXML(surface, elementXML);
					}
				}
			}
		}
		
		private function itemFromXML(parent:Object, itemXML:XML):IComponent
		{
			var name:String = itemXML.localName();
			//we don't need handel "<div>" in the domino visual editor
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
			//Alert.show("domino convert name:"+name);
			var item:IComponent = getNewInstanceOfComponent(name);
			if(item === null)
			{
				//var errorMessage:String = "Failed to create surface component: " + name;
				//dispatchEvent(new ConverterErrorEvent(errorMessage));
				//throw new Error(errorMessage);
				return null;
			}else{
				 item.fromXML(itemXML, this.itemFromXML);
				 if(parent!=null){
					 parent.addElement(item);
				 }
				 if(componentsSurface!=null){
					componentsSurface.addItem(item);
				 }
				 
			
				return item;

			}
			
			
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

            this.classLookup[DominoTable.PRIMEFACE_ELEMENT_NAME] = DominoTable;
			this.classLookup[DominoTable.ELEMENT_NAME] = DominoTable;
			//Domino label have specified format ,it not a signal tag name, it contain 3 tag, so this myabe a trouble in here
			//this.classLookup[DominoLabel.ELEMENT_NAME] = DominoLabel;
			this.classLookup[DominoInputText.ELEMENT_NAME] = DominoInputText;
			this.classLookup[DominoRow.DOMINOROW_NAME] = DominoRow;
			this.classLookup[GridItem.GRIDITEM_NAME] = GridItem;
			this.classLookup[Div.ELEMENT_NAME] = Div;
			// this.classLookup[GridRow.ELEMENT_NAME] = GridRow;
			// this.classLookup[view.primeFaces.supportClasses.Container.ELEMENT_NAME] = view.primeFaces.supportClasses.Container;
			this.classLookup[DominoSection.ELEMENT_NAME] = DominoSection;
			this.classLookup[DominoTabView.ELEMENT_NAME] = DominoTabView;
			this.classLookup[DominoCalendar.ELEMENT_NAME] = DominoCalendar;
			this.classLookup[NavigatorContent.NAVIGATORCONTENT_NAME] = NavigatorContent;
			
		}
	}
}