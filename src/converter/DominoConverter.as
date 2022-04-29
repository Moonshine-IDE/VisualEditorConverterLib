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
	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.ISurface;

	import surface.SurfaceMockup;

	public class DominoConverter
	{
		//private var unknownItemsExceptions:Array;

		public static function fromXMLOnly(lookup:ILookup, xml:XML):SurfaceMockup
		{	
			var surfaceMockup:SurfaceMockup = new SurfaceMockup();
			fromXML(surfaceMockup, lookup, xml);

			return surfaceMockup;
		}	
		
		public static function fromXML(surface:ISurface, lookup:ILookup, xml:XML):void
		{
			if(xml != null)
			{
				var localSurface:ISurface = surface;
				var elements:XMLList = xml.elements();
				if(elements!=null)
				{
					var elementCount:int = elements.length();
			
					for(var i:int = 0; i < elementCount; i++)
					{
						var elementXML:XML = elements[i];
					
						var component:IComponent = itemFromXML(localSurface, lookup, elementXML, localSurface);
						localSurface.addItem(component);
					}
				}
			}
		}
		
		private static function itemFromXML(parent:Object, lookup:ILookup, itemXML:XML, surface:ISurface):IComponent
		{
			var localSurface:ISurface = surface;
			var name:String = itemXML.localName();
			//we don't need handel "<div>" in the domino visual editor
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
			//Alert.show("domino convert name:"+name);
			var item:IComponent = getNewInstanceOfComponent(lookup, name);
			if(item === null)
			{
				//var errorMessage:String = "Failed to create surface component: " + name;
				//dispatchEvent(new ConverterErrorEvent(errorMessage));
				//throw new Error(errorMessage);
				return null;
			}
			else
			{
				 item.fromXML(itemXML, itemFromXML, localSurface, lookup);
				 if(parent!=null)
				 {
					 parent.addElement(item);
				 }

				 localSurface.addItem(item);

				 return item;
			}
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