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
    import components.GridItem;
    import components.GridRow;
	import components.common.Div;

	import converter.PrimeFacesConverter;

    import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.ISurface;
	import interfaces.components.IDiv;
	import interfaces.components.IGrid;

    import utils.CodeMxmlUtils;
    import utils.CodeXMLUtils;

	public class Grid extends ComponentBase implements IGrid
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "outputPanel";
        public static const ELEMENT_NAME:String = "Grid";
			
		private static const MAX_COLUMN_COUNT:int = 12;

		private var _component:IComponent;

		public function Grid(component:IComponent = null)
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

			var elementsXML:XMLList = xml.elements();
            if (elementsXML.length() > 0)
            {
                var childCount:int = elementsXML.length();
                for(var row:int = 0; row < childCount; row++)
                {
                    var rowXML:XML = elementsXML[row];
                    var colListXML:XMLList = rowXML.elements();

                    var gridRow:Object = PrimeFacesConverter.getNewInstanceOfComponent(lookup, GridRow.GRIDROW_NAME);
 					gridRow.percentWidth = gridRow.percentHeight = 100;

                    var colCount:int = colListXML.length();
                    for (var col:int = 0; col < colCount; col++)
                    {
                        var colXML:XML = colListXML[col];
                        if (colXML.length() > 0)
                        {
                            var gridItem:Object = PrimeFacesConverter.getNewInstanceOfComponent(lookup, GridItem.GRIDITEM_NAME);
     						gridItem.percentWidth = gridRow.percentHeight = 100;

                            var divXMLList:XMLList = colXML.elements();
                            var divXML:XML = divXMLList[0];

                            var div:Object = PrimeFacesConverter.getNewInstanceOfComponent(lookup, Div.ELEMENT_NAME);
                            div.percentWidth = div.percentHeight = 100;

                            gridItem.addElement(div);
                            gridRow.addElement(gridItem);

                            divXML.@percentWidth = 100;
                            divXML.@percentHeight = 100;

                            div.fromXML(divXML, childFromXMLCallback, localSurface, lookup);
                        }
                    }

                    component["addElement"](gridRow);
                }
            }
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

            var gridRowNumElements:int = component["numElements"];
            for (var row:int = 0; row < gridRowNumElements; row++)
            {
                var rowXML:XML = new XML("<div />");
                rowXML["@class"] = "ui-g";

                var gridRow:Object = component["getElementAt"](row);
                var gridColumnNumElements:int = gridRow.numElements;
                for (var col:int = 0; col < gridColumnNumElements; col++)
                {
                    var gridCol:Object = gridRow["getElementAt"](col);
                    var div:Object = gridCol.getElementAt(0);

                    var colXML:XML = new XML("<div />");
                    colXML["@class"] = this.getClassNameBasedOnColumns(gridColumnNumElements);

                    var divXML:XML = removeHeightFromInternalDiv(div.toCode());

                    colXML.appendChild(divXML);

                    rowXML.appendChild(colXML);
                }

                xml.appendChild(rowXML);
            }

            return xml;
		}

		private function getClassNameBasedOnColumns(coulumnCountInRow:int):String
        {
            var columnFactor:int = MAX_COLUMN_COUNT / coulumnCountInRow;

            var uigDefault:String = "ui-g-" + columnFactor;
            var uigDesktop:String = "ui-lg-" + columnFactor;

            var uigPhones:String = "ui-sm-" + columnFactor;
            var uigTablets:String = "ui-md-" + columnFactor;
            var uigBigScreens:String = "ui-xl-" + columnFactor;

            return uigDefault + " " + uigDesktop + " " + uigPhones + " " + uigTablets + " " + uigBigScreens;
        }

		private function removeHeightFromInternalDiv(div:XML):XML
        {
            delete div.@height;
            delete div.@percentHeight;
            div.@style = "width:100%;";

            return div;
        }
	}
}