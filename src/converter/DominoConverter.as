////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) STARTcloud, Inc. 2015-2022. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the Server Side Public License, version 1,
//  as published by MongoDB, Inc.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  Server Side Public License for more details.
//
//  You should have received a copy of the Server Side Public License
//  along with this program. If not, see
//
//  http://www.mongodb.com/licensing/server-side-public-license
//
//  As a special exception, the copyright holders give permission to link the
//  code of portions of this program with the OpenSSL library under certain
//  conditions as described in each individual source file and distribute
//  linked combinations including the program with the OpenSSL library. You
//  must comply with the Server Side Public License in all respects for
//  all of the code used other than as permitted herein. If you modify file(s)
//  with this exception, you may extend this exception to your version of the
//  file(s), but you are not obligated to do so. If you do not wish to do so,
//  delete this exception statement from your version. If you delete this
//  exception statement from all source files in the program, then also delete
//  it in the license file.
//
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
						if(component!=null)
						{
							localSurface.addItem(component);
						}
					}
				}
			}
		}


		public static function pasteFromXML(parent:Object, lookup:ILookup, xml:XML,surface:ISurface):Object
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
					
						pasteItemFromXML(parent, lookup, elementXML, localSurface);
						
					}
				}
			}

			return parent;
		}


		private static function pasteItemFromXML(parent:Object, lookup:ILookup, itemXML:XML, surface:ISurface):IComponent
		{
			var localSurface:ISurface = surface;
			var name:String = itemXML.localName();
			//we don't need handel "<div>" in the domino visual editor
			if(!(name in lookup.lookup))
			{
				
				
                var elements:XMLList = itemXML.elements();
                var elementCount:int = elements.length();
                for(var i:int = 0; i < elementCount; i++)
                {
                   var elementXML:XML = elements[i];
                   pasteItemFromXML(parent, lookup, elementXML, localSurface);
                }
				return null;
			}
			//Alert.show("domino convert name:"+name);
			var item:IComponent = getNewInstanceOfComponent(lookup, name);
			if(item === null)
			{
				
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
		
		public static function itemFromXML(parent:Object, lookup:ILookup, itemXML:XML, surface:ISurface):IComponent
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