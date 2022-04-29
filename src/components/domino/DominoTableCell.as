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