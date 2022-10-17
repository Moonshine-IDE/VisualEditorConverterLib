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

package components.domino
{
	import components.ComponentBase;
	import components.DominoConponentHideBase;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
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

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
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