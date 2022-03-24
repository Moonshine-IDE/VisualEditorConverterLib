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
	import interfaces.IDominoComponent;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.dominoComponents.IDominoBody;

	import utils.CodeMxmlUtils;

	import utils.CodeXMLUtils;

	/**
	 *  <p>Representation and converter for Domino Body</p>
	 * 
	 *  <p>This class work for  convert from Visuale main container components to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  Visuale UI main container component from Visual Editor</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *  &lt;item name=&quot;$Body&quot; sign=&quot;true&quot;&gt;&lt;richtext&gt;&lt;/richtext&gt;&lt;/item&gt;
     * </pre>
	 * 
	 * <p> Example Royale output:</p>
	 * <pre>
	 * &lt;j:ApplicationMainContent&gt;&lt;j:ScrollableSectionConten&gt;&lt;/j:ScrollableSectionConten&gt;&lt;/j:ApplicationMainContent&gt;
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_BODY_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/Body.as
	 */
	public class Body extends ComponentBase implements IDominoBody, IRoyaleComponentConverter
	{
		private static const DOMINO_ELEMENT_NAME:String = "body";
		public static var ELEMENT_NAME:String = "Body";

		public function Body(component:IDominoComponent = null)
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

		private var _component:IDominoComponent;

		private function get component():IDominoComponent
		{
			return _component ? _component : this;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this._xml = xml;

			setComponentSize(xml);

			var elementsXML:XMLList = xml.elements();
			var childCount:int = elementsXML.length();
			for (var i:int = 0; i < childCount; i++)
			{
				var childXML:XML = elementsXML[i];
				childFromXMLCallback(component, childXML);
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
			CodeXMLUtils.addSizeHtmlStyleToXML(xml, this as IDominoComponent);
			var elementCount:int = component["numElements"];
			var element:IDominoComponent = null;
			for (var i:int = 0; i < elementCount; i++)
			{
				element = component["getElementAt"](i) as IDominoComponent;
				xml.appendChild(element.toCode());
			}

            elementCount = component["numElements"];
            for(var j:int = 0; j < elementCount; j++)
            {
                element = component["getElementAt"](j) as IDominoComponent;
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