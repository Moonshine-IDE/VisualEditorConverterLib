////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2016-present Prominic.NET, Inc.
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
package components.primeFaces
{
	import components.ComponentBase;
	import components.common.Div;

	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.ISurface;
	import interfaces.components.IFieldset;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import converter.PrimeFacesConverter;
	
	public class Fieldset extends ComponentBase implements IFieldset
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "fieldset";
		public static const ELEMENT_NAME:String = "Fieldset";
		
		private static const DEFAULT_DURATION:int = 200;
		
		private var _component:IComponent;

		private var thisCallbackXML:Function;
		
		public function Fieldset(component:IComponent = null):void
		{
			super();
			
			_component = component;
		}
		
		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}
		
		private var _title:String;
		public function get title():String
		{
			return _title;
		}
		public function set title(value:String):void
		{
			_title = value;
		}
		
		private var _toggleable:Boolean;
		public function get toggleable():Boolean
		{
			return _toggleable;
		}
		public function set toggleable(value:Boolean):void
		{
			_toggleable = value;
		}
		
		private var _duration:Number = DEFAULT_DURATION;
		public function get duration():Number
		{
			return _duration;
		}
		public function set duration(value:Number):void
		{
			_duration = value;
		}

		private function get component():IComponent
		{
			return _component ? _component : this;
		}
		
		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			var localSurface:ISurface = surface;

			this.setComponentSize(xml);

			this.title = xml.@legend;
			this.toggleable = xml.@toggleable == "true" ? true : false;
			
			this.duration = DEFAULT_DURATION;
			
			var togglSpeed:String = String(xml.@toggleSpeed);
			if (this.toggleable && togglSpeed)
			{
				var toggleDuration:Number = Number(xml.@toggleSpeed);
				this.duration = isNaN(toggleDuration) || toggleDuration == 0 ? DEFAULT_DURATION : toggleDuration;
			}
			
			thisCallbackXML = childFromXMLCallback;
			createChildren(xml.elements(), localSurface, lookup);
		}
		
		/**
		 * Complexity of this component requires separate implementation of this method on client sight
		 */
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@legend = this.title;
			xml.@toggleable = this.toggleable;
			xml.@toggleSpeed = this.duration;
			
			var elementCount:int = component["numElements"];
			for(var i:int = 0; i < elementCount; i++)
			{
				var element:IComponent = component["getElementAt"](i) as IComponent;
				if(element === null)
				{
					continue;
				}
				
				xml.appendChild(element.toCode());
			}

			return xml;
		}

		private function createChildren(elements:XMLList, surface:ISurface, lookup:ILookup = null):void
		{
			var localSurface:ISurface = surface;
			if ((!elements || elements.length() == 0) && (thisCallbackXML == null)) return;
			
			var divXML:XML = elements[0];
			var childCount:int = divXML.length();
			var item:IComponent = null;
			
			if (component["numElements"] > 0)
			{
				item = component["getElementAt"](0);
			}
			else
			{
				item = PrimeFacesConverter.getNewInstanceOfComponent(lookup, Div.ELEMENT_NAME);
			}
			
			for (var itemIndex:int; itemIndex < childCount; itemIndex++)
			{
				var itemXML:XML = divXML[itemIndex];
				item.fromXML(itemXML, thisCallbackXML, localSurface, lookup);
			}
			
			if (component["numElements"] == 0)
			{
				component["addElement"](item);
			}
		}
	}
}