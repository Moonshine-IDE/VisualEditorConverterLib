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

	import interfaces.ILookup;
	import interfaces.ISurface;

	import interfaces.components.ITree;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class Tree extends ComponentBase implements ITree
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "tree";
		public static const ELEMENT_NAME:String = "Tree";
		
		private var _treeVar:String;
		public function get treeVar():String
		{
			return _treeVar;
		}
		public function set treeVar(value:String):void
		{
			_treeVar = value;
		}
		
		private var _treeValue:String;
		public function get treeValue():String
		{
			return _treeValue;
		}
		public function set treeValue(value:String):void
		{
			_treeValue = value;
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

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface,  lookup:ILookup):void
		{
			this.setComponentSize(xml);
			
			if ("@var" in xml)
			{
				this.treeVar = xml.@["var"];
			}
			
			if ("@value" in xml)
			{
				this.treeValue = xml.@value;
			}	
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			var hNamespace:Namespace = new Namespace("h", "http://xmlns.jcp.org/jsf/html");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			
			if (treeVar)
			{
				xml.@["var"] = this.treeVar;
			}
			
			if (treeValue)
			{
				xml.@value = this.treeValue;
			}
			
			var node:XML = new XML("<treeNode/>");
			node.addNamespace(primeFacesNamespace);
			node.setNamespace(primeFacesNamespace);
			
			var outputText:XML;
			if (this.treeVar != "")
			{
				outputText = new XML("<outputText/>");
				outputText.addNamespace(hNamespace);
				outputText.setNamespace(hNamespace);
				outputText.@value = "#{"+ this.treeVar +"}";
				node.appendChild(outputText);
			}
			
			xml.appendChild(node);
			
			return xml;
		}
	}
}