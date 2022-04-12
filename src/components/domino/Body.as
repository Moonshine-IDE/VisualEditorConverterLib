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
package components.domino
{
	import components.ComponentBase;

	import interfaces.IComponent;
	import interfaces.ILookup;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.dominoComponents.IDominoBody;

	import utils.CodeMxmlUtils;

	import utils.CodeXMLUtils;

	/**
	 * This class work for  convert from Visuale main container components to target framework of body format.
	 * Call different methods to convert the component to different target formats.
	 * For now:
	 * toCode() will convert the Visuale main container components to domino button  dxl format.
	 * toRoyaleConvertCode() will  convert the Visuale main container components to Rayale button format.
	 * For Test Input&Output:
	 * Input : Visuale UI main container component from Visual Editor
	 * Output example:  Domino - <itme name="$Body" sign="true"><richtext></richtext></item>
	 * 				   Royale - <j:ApplicationMainContent><j:ScrollableSectionConten></j:ScrollableSectionCont></j:ApplicationMainContent>
	 *
	 * {@link #components.domino}
	 */
	public class Body extends ComponentBase implements IDominoBody, IRoyaleComponentConverter
	{
		private static const DOMINO_ELEMENT_NAME:String = "body";
		public static var ELEMENT_NAME:String = "Body";

		public function Body(component:IComponent = null)
		{
			super();

			this._component = component;
		}
		private var _xml:XML;

		private var _isSelected:Boolean;

		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		private var _component:IComponent;

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void
		{
			this._xml = xml;

			setComponentSize(xml);

			var elementsXML:XMLList = xml.elements();
			var childCount:int = elementsXML.length();
			for (var i:int = 0; i < childCount; i++)
			{
				var childXML:XML = elementsXML[i];
				childFromXMLCallback(component, lookup, childXML);
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
			CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IComponent);
			var elementCount:int = component["numElements"];
			var element:IComponent = null;
			for (var i:int = 0; i < elementCount; i++)
			{
				element = component["getElementAt"](i) as IComponent;
				xml.appendChild(element.toCode());
			}

            elementCount = component["numElements"];
            for(var j:int = 0; j < elementCount; j++)
            {
                element = component["getElementAt"](j) as IComponent;
                xml.appendChild(element.toCode());
            }
			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return new XML("");
		}
	}
}