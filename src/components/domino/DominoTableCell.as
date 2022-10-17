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
	import components.enum.ColorName;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoTableCell;


	/**
	 *  <p>Representation and converter from  Visuale tableCell  components  </p>
	 * 
	 *  <p>This class work for  convert from Visuale tableCell  components  to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoTableCell</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *  &lt;tablecell bgcolor=&quot;#e0ffbf&quot;&gt;
	 *					&lt;pardef id=&quot;3&quot; align=&quot;center&quot; 									leftmargin=&quot;0.0313in&quot; keepwithnext=&quot;true&quot; 							keeptogether=&quot;true&quot; /&gt;
	 *					&lt;par def=&quot;3&quot;&gt;
	 *						&lt;picture height=&quot;341px&quot; width=&quot;218px&quot; 								alttext=&quot;caldesigns white two-piece 								dress&quot;&gt;
	 *							&lt;imageref name=&quot;design1.jpg&quot; /&gt;
	 *							&lt;caption&gt;CALDesigns&lt;/caption&gt;
	 *						&lt;/picture&gt;
	 *					&lt;/par&gt;
	 *	&lt;/tablecell&gt;
	 * </pre> 
	 *
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_TABLECELL_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoTableCell.as
	 */

	
	public class DominoTableCell extends DominoConponentHideBase implements IDominoTableCell, IRoyaleComponentConverter
	{

		public function DominoTableCell()
		{
			super();
		}

		private var _bgcolor:ColorName;
		public function get bgcolor():ColorName
		{
			return _bgcolor;
		}

		public function set bgcolor(value:ColorName):void
		{
			_bgcolor = value;
		}

		private var _rowspan:Number;
		public function get rowspan():Number
		{
			return _rowspan;
		}

		public function set rowspan(value:Number):void
		{
			_rowspan = value;
		}

		private var _columnspan:Number;
		public function get columnspan():Number
		{
			return _columnspan;
		}

		public function set columnspan(value:Number):void
		{
			_columnspan = value;
		}

		private var _colorstyle:Number;
		public function get colorstyle():Number
		{
			return _colorstyle;
		}

		public function set colorstyle(value:Number):void
		{
			_colorstyle = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<tablerow/>");

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return null;
		}
	}
}