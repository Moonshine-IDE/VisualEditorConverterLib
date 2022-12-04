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
package components.primeFaces
{
	import interfaces.ILookup;
	import interfaces.ISurface;

	import mx.utils.StringUtil;
	
	import components.ComponentBase;
	
	import interfaces.components.IInputTextarea;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class InputTextarea extends ComponentBase implements IInputTextarea
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "inputTextarea";
		public static const ELEMENT_NAME:String = "InputTextarea";
		
		private static const DEFAULT_COUNTER_TEMPLATE:String = "{0} characters remaining.";
		
		private var _text:String;
		public function set text(value:String):void
		{
			_text = value;
		}
		public function get text():String
		{
			return _text;
		}	
		
		private var _isAutoResize:Boolean;
		public function get isAutoResize():Boolean
		{
			return _isAutoResize;
		}
		public function set isAutoResize(value:Boolean):void
		{
			_isAutoResize = value;
		}
		
		private var _maxLength:String = "";
		public function get maxLength():String
		{
			return _maxLength;
		}
		public function set maxLength(value:String):void
		{
			_maxLength = value;
		}
		
		private var _required:Boolean;
		public function get required():Boolean
		{
			return _required;
		}
		public function set required(value:Boolean):void
		{
			_required = value;
		}
		
		private var _isCounterDisplay:Boolean;
		public function get isCounterDisplay():Boolean
		{
			return _isCounterDisplay;
		}
		public function set isCounterDisplay(value:Boolean):void
		{
			_isCounterDisplay = value;
		}
		
		private var _counterTemplate:String = DEFAULT_COUNTER_TEMPLATE;
		public function get counterTemplate():String
		{
			return _counterTemplate;
		}
		public function set counterTemplate(value:String):void
		{
			_counterTemplate = value;
		}
		
		private var _counter:String;
		public function get counter():String
		{
			return _counter;
		}
		public function set counter(value:String):void
		{
			_counter = value;
		}
		
		private var _idAttribute:String;
		public function get idAttribute():String
		{
			return _idAttribute;
		}
		public function set idAttribute(value:String):void
		{
			_idAttribute = value;
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

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);
			
			this.text = xml.@value;
			this.isAutoResize = xml.@isAutoResize == "true";
			this.maxLength = xml.@maxlength;
			this.required = xml.@required == "true";
			
			if (String(xml.@isCounterDisplay) == "true")
			{
				this.isCounterDisplay = true;
				this.counterTemplate = String(xml.@counterTemplate);
				if (xml.@counter != undefined) this.counter = String(xml.@counter);
			}
			
			this.idAttribute = xml.@id;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			if (this.text)
			{
				xml.@value = this.text;
			}
			xml.@autoResize = this.isAutoResize;
			xml.@required = this.required;
			
			if ((StringUtil.trim(maxLength).length != 0) && Math.round(Number(maxLength)) != 0)
			{
				xml.@maxlength = this.maxLength;
			}
			if (isCounterDisplay)
			{
				xml.@counterTemplate = this.counterTemplate;
				if (StringUtil.trim(counter).length != 0) xml.@counter = this.counter;
			}
			
			if (this.idAttribute)
			{
				xml.@id = this.idAttribute;
			}
			
			return xml;
		}
	}
}