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
	import components.ComponentBase;

	import interfaces.ILookup;
	import interfaces.ISurface;

	import interfaces.components.IDataTable;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	import vo.DataProviderListItem;
	
	public class DataTable extends ComponentBase implements IDataTable
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "dataTable";
		public static const ELEMENT_NAME:String = "DataTable";
		
		private static const NO_RECORDS_FOUND:String = "No records found.";
		
		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}
		
		private var _paginator:Boolean;
		public function get paginator():Boolean
		{
			return _paginator;
		}
		public function set paginator(value:Boolean):void
		{
			_paginator = value;
		}
		
		private var _resizableColumns:Boolean;
		public function get resizableColumns():Boolean
		{
			return _resizableColumns;
		}
		public function set resizableColumns(value:Boolean):void
		{
			_resizableColumns = value;
		}
		
		private var _emptyMessage:String = NO_RECORDS_FOUND;
		public function get emptyMessage():String
		{
			return _emptyMessage;
		}
		public function set emptyMessage(value:String):void
		{
			_emptyMessage = value;
		}
		
		private var _tableVar:String = "";
		public function get tableVar():String
		{
			return _tableVar;
		}
		public function set tableVar(value:String):void
		{
			_tableVar = value;
		}
		
		private var _tableValue:String = "";
		public function get tableValue():String
		{
			return _tableValue;
		}
		public function set tableValue(value:String):void
		{
			_tableValue = value;
		}
		
		private var _tableColumnDescriptor:Array;
		public function get tableColumnDescriptor():Array
		{
			return _tableColumnDescriptor;
		}
		public function set tableColumnDescriptor(value:Array):void
		{
			_tableColumnDescriptor = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);

			this.paginator = xml.@paginator == "true";
			this.resizableColumns = xml.@resizableColumns == "true";
			this.emptyMessage = !xml.@emptyMessage ? NO_RECORDS_FOUND : xml.@emptyMessage;
			this.tableVar = xml.@['var'];
			this.tableValue = xml.@value;
			
			_tableColumnDescriptor = [];
			
			// re-generate column
			for each (var col:XML in xml.column)
			{
				var tmpColumnVO:DataProviderListItem = new DataProviderListItem();
				tmpColumnVO.label = col.@headerText;
				tmpColumnVO.value = col.@value;
				_tableColumnDescriptor.push(tmpColumnVO);
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

			xml.@paginator = this.paginator;
			xml.@resizableColumns = this.resizableColumns;
			xml.@emptyMessage = this.emptyMessage;
			if (tableVar != "") xml.@['var'] = tableVar;
			if (tableValue != "") xml.@value = tableValue;
			
			var column:XML;
			var outputText:XML;
			for each (var col:DataProviderListItem in tableColumnDescriptor)
			{
				column = new XML("<column/>");
				column.addNamespace(primeFacesNamespace);
				column.setNamespace(primeFacesNamespace);
				column.@headerText = col.label;
				
				if (tableVar != "")
				{
					outputText = new XML("<outputText/>");
					outputText.addNamespace(hNamespace);
					outputText.setNamespace(hNamespace);
					outputText.@value = "#{"+ tableVar +"."+ (col.value ||= '') +"}";
					column.appendChild(outputText);
				}
				
				xml.appendChild(column);
			}

			return xml;
		}
	}
}