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
	import interfaces.components.IButton;
	import components.ComponentBase;
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;

	public class Button extends ComponentBase implements IButton
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "button";
		public static const PRIME_FACES_XML_ELEMENT_NAME_COMMAND_BUTTON:String = "commandButton";
		public static const ELEMENT_NAME:String = "Button";

		public function Button():void
		{
			super();	
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
		
		private var _enabled:Boolean;
		public function get enabled():Boolean
		{
			return _enabled;
		}

		public function set enabled(value:Boolean):void
		{
			_enabled = value;
		}
		
		private var _isCommandButton:Boolean;
		public function get isCommandButton():Boolean
		{
			return _isCommandButton;
		}

		public function set isCommandButton(value:Boolean):void
		{
			_isCommandButton = value;
		}
		
		private var _label:String;
		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}		
		
		private var _toolTip:String;
		public function get toolTip():String
		{
			return _toolTip;
		}

		public function set toolTip(value:String):void
		{
			_toolTip = value;
		}
		
		private var _actionListener:String;
		public function get actionListener():String
		{
			return _actionListener;
		}

		public function set actionListener(value:String):void
		{
			_actionListener = value;
		}
	
		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);
			
			this.enabled = xml.@disabled == "false" ? true : false;
			this.isCommandButton = xml.@isCommandButton == "true" ? true : false;
            this.label = xml.@value;
            this.toolTip = xml.@title;
			this.actionListener = xml.@actionListener;
		}
		
		public function toCode():XML
		{
			var tagFace:String = isCommandButton ? PRIME_FACES_XML_ELEMENT_NAME_COMMAND_BUTTON : PRIME_FACES_XML_ELEMENT_NAME;
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, tagFace) + "/>");
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            xml.addNamespace(primeFacesNamespace);
            xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			xml.@disabled = !this.enabled;
            xml.@value = this.label;
			xml.@title = this.toolTip;
			if (isCommandButton) xml.@actionListener = this.actionListener;

			return xml;
		}
	}
}