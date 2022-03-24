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

	import interfaces.IRoyaleComponentConverter;
	import interfaces.dominoComponents.IDominoColor;

	/**
	 *  <p>Representation and converter for Visuale  component color property</p>
	 * 
	 *  <p> This class work for  convert from Visuale   components color property to target framework of domino dxl format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  TODO</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoColor</p>
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
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_DEFINED_ENTITIES_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoColor.as
	 */


	public class DominoColor extends ComponentBase implements IDominoColor, IRoyaleComponentConverter
	{
		public function DominoColor()
		{
			super();
		}

		private var _name:String;
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function toRoyaleConvertCode():XML
		{
			return new XML("");
		}
	}
}