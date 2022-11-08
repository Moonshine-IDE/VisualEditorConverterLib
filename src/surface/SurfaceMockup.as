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
package surface
{
	import interfaces.IComponentData;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.IComponent;
	import interfaces.IVisualComponent;
	import utils.MainTagCodeUtils;
	import interfaces.components.IDiv;


	public class SurfaceMockup implements ISurface, IVisualComponent, IComponent
	{
		private var _elements:Array;
	
		public function SurfaceMockup():void
		{
			_elements = [];	
		}		
		
		private var _width:Number;
		public function get width():Number
		{
			return _width;
		}

		public function set width(value:Number):void
		{
			_width = value;
		}
		
		private var _height:Number;
		public function get height():Number
		{
			return _height;
		}

		public function set height(value:Number):void
		{
			_height = value;
		}
		
		private var _percentWidth:Number;
		public function get percentWidth():Number
		{
			return _percentWidth;
		}

		public function set percentWidth(value:Number):void
		{
			_percentWidth = value;
		}
		
		private var _percentHeight:Number;
		public function get percentHeight():Number
		{
			return _percentHeight;
		}

		public function set percentHeight(value:Number):void
		{
			_percentHeight = value;
		}
		
		public function addItem(item:IComponent):void
		{
			
		}
		
		public function get numElements():int
		{
			if (_elements)
			{
				return _elements.length;	
			}	
			
			return 0;
		}		

		public function addElement(element:Object):void
		{
			_elements.push(element);		
		}
		
		public function getElementAt(index:int):Object
		{
			if (numElements > 0) 
			{
				return _elements[index]
			}
			
			return null;
		}

		public function getComponentData():Array
		{
			var element:Object = this.getElementAt(0);
			var elementCount:int = (element as IVisualComponent).numElements;
			var componentData:Array = [];

			for (var i:int = 0; i < elementCount; i++)
			{
				var item:IComponentData = element.getElementAt(i) as IComponentData;

				if (item === null)
				{
					continue;
				}

				var compData:Object = item.getComponentData();
				componentData.push(compData);
			}

			return componentData;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			throw new Error("Surface doesn't implement fromXML method!");
		}
		
		public function toCode():XML
		{
			var element:Object = this.getElementAt(0);
			var xml:XML = MainTagCodeUtils.getParentContent("", element as IDiv);
            var mainContainer:XML = MainTagCodeUtils.getMainContainerTag(xml);

			var elementCount:int = (element as IVisualComponent).numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IComponent = element.getElementAt(i) as IComponent;

                if (item === null)
                {
                        continue;
                }

			    XML.ignoreComments = false;
                var code:XML = item.toCode();
				var commentOnlyXML:XMLList = (code.elements("primeFacesCommentOnlyTag").length() > 0) ?
											  code.elements("primeFacesCommentOnlyTag") : null;
                if (mainContainer)
                {
                    mainContainer.appendChild(!commentOnlyXML ? code : commentOnlyXML.children());
                }
                else
                {
                    xml.appendChild(!commentOnlyXML ? code : commentOnlyXML.children());
                }
            }

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			var element:Object = this.getElementAt(0);
			var jNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			var xml:XML = new XML("<VGroup />");
				xml.setNamespace(jNamespace);

			var internalContainer:XML = new XML("<VGroup />");
				internalContainer.@includeIn = "contentState";
				internalContainer.@percentWidth = "100";
				internalContainer.@percentHeight = "100";
				internalContainer.setNamespace(jNamespace);

			var beadsXML:XML = new XML("<beads />");
			beadsXML.setNamespace(jNamespace);

			var scrollViewportXML:XML = new XML("<ScrollingViewport/>");
				scrollViewportXML.setNamespace(jNamespace);

			beadsXML.appendChild(scrollViewportXML);
			internalContainer.appendChild(beadsXML);

			var elementCount:int = (element as IVisualComponent).numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IRoyaleComponentConverter = element.getElementAt(i) as IRoyaleComponentConverter;

                if (item === null)
                {
					continue;
                }

			    XML.ignoreComments = false;
                var code:XML = (item as IRoyaleComponentConverter).toRoyaleConvertCode();
				internalContainer.appendChild(code);
            }

			xml.appendChild(internalContainer);

			return xml;
		}

		public function toDominoCode(mainContainer:XML):XML
		{
			
			var elementCount:int = this.numElements;
			
			for (var i:int = 0; i < elementCount; i++)
            {
                var item:IComponent = this.getElementAt(i) as IComponent;

                if (item === null)
                {
                        continue;
                }

			    XML.ignoreComments = false;
                var code:XML = item.toCode();
				var name:String = code.localName();
				
                 mainContainer.appendChild(code);
            }

			return mainContainer;
		}

		
	}
}