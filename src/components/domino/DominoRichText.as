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
	import components.DominoConponentHideBase;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.dominoComponents.IDominoRichText;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	/**
	 *  <p>Representation and converter from domino richtext class  </p>
	 * 
	 *  <p>This class work for  convert fromdomino richtext class  to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  TODO</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoRichText</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 * TODO
	 * </pre> 
	 *
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_RICHTEXT_ROOT_ELEMENT_XML.html
	 */


	public class DominoRichText extends DominoConponentHideBase implements IDominoRichText, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "richtext";
		public static const ELEMENT_NAME:String = "Richtext";

		public function DominoRichText()
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

		private var _text:String;
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		private var _maxLength:String;
		public function get maxLength():String
		{
			return _maxLength;
		}

		public function set maxLength(value:String):void
		{
			_maxLength = value;
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

		private var _required:Boolean;
		public function get required():Boolean
		{
			return _required;
		}

		public function set required(value:Boolean):void
		{
			_required = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, lookup:ILookup = null):void
		{
			this.setComponentSize(xml);

			this.text = xml.@value;
			this.maxLength = xml.@maxlength;
			this.idAttribute = xml.@id;
			this.required = xml.@required == "true";
			//this.nameAttribute = xml.@nameAttribute;
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

			CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);

			if (this.text)
			{
				xml.@value = this.text;
			}

			xml.@required = this.required;

			var stringHelper:StringHelperUtils = new StringHelperUtils();

			if ((stringHelper.trim(maxLength, " ").length != 0) && Math.round(Number(maxLength)) != 0)
			{
				xml.@maxlength = this.maxLength;
			}

			if (this.idAttribute)
			{
				xml.@id = this.idAttribute;
			}

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return new XML("");
		}
	}
}