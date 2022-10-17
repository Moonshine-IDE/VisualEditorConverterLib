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
	import interfaces.dominoComponents.IDominoRun;

	import utils.CodeMxmlUtils;


	/**
	 *  <p>Representation and converter from  run element of Visuale label/text/field   </p>
	 * 
	 *  <p>This class work for  convert from run element of Visuale label/text/field  components  to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoRun</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 * &lt;run&gt;{other some domino element}&lt;/run&gt;
	 * </pre> 
	 *
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_RUN_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoRun.as
	 */

	public class DominoRun extends DominoConponentHideBase implements IDominoRun, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "run";
		public static const ELEMENT_NAME:String = "run";

		public function DominoRun()
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

		private var _html:Boolean;
		public function get html():Boolean
		{
			return _html;
		}

		public function set html(value:Boolean):void
		{
			_html = value;
		}


		private var _highlight:String;
		public function get highlight():String
		{
			return _highlight;
		}

		public function set highlight(value:String):void
		{
			_highlight = value;
		}


		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);
			if (this.html)
			{
				this.html = true;
			} else
			{
				this.html = false;
			}

			if (this.highlight)
			{
				this.highlight = xml.@highlight;
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

			if (this.html)
			{
				xml.@html = "true";
			} else
			{
				xml.@html = "false";
			}

			if (this.highlight)
			{
				xml.@highlight = this.highlight;
			}

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return null;

		}


	}
}