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
	import interfaces.ILookup;
	import interfaces.ISurface;

	import mx.utils.StringUtil;
	
	import components.ComponentBase;
	
	import interfaces.components.ITextEditor;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class TextEditor extends ComponentBase implements ITextEditor
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "textEditor";
		public static const ELEMENT_NAME:String = "TextEditor";
		
		private var _widgetVar:String;
		public function set widgetVar(value:String):void
		{
			_widgetVar = value;
		}
		public function get widgetVar():String
		{
			return _widgetVar;
		}	
		
		private var _text:String;
		public function set text(value:String):void
		{
			_text = value;
		}
		public function get text():String
		{
			return _text;
		}
		
		private var _pendingPlaceHolder:String;
		public function set placeholder(value:String):void
		{
			_pendingPlaceHolder = value;
		}
		public function get placeholder():String
		{
			return _pendingPlaceHolder;
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
			
			if ("@text" in xml) 
			{
				this.text = xml.@text;
			}	
			this.widgetVar = xml.@widgetVar;		
			this.placeholder = xml.@placeholder;
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@widgetVar = this.widgetVar ? this.widgetVar : "";
			if (this.text)
			{
				xml.@value = this.text;
			}
			
			if (this.placeholder && StringUtil.trim(this.placeholder).length != 0) xml.@placeholder = this.placeholder;
			return xml;
		}
	}
}