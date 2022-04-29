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
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoFont;

	import utils.CodeMxmlUtils;

	/**
	 *  <p>Representation and converter for Visuale components of font property </p>
	 * 
	 *  <p>This class work for  convert from Visuale components of font property to target framework of domino dxl.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoFont</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *   &lt;font size=&#39;12&#39; color=&quot;black&quot;&gt;&lt;/font&gt;
     * </pre>
	 * 
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_FONT_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoFont.as
	 */

	public class DominoFont extends DominoConponentHideBase implements IDominoFont, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "font";
		public static const ELEMENT_NAME:String = "font";

		public function DominoFont()
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


		private var _color:String;
		public function get color():String
		{
			return _color;
		}

		public function set color(value:String):void
		{
			_color = value;
		}

		private var _size:String;
		public function get size():String
		{
			return _size;
		}

		public function set size(value:String):void
		{
			_size = value;
		}

		private var _style:String;
		public function get style():String
		{
			return _style;
		}

		public function set style(value:String):void
		{
			_style = value;
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

		private var _truetype:Boolean;
		public function get truetype():Boolean
		{
			return _truetype;
		}

		public function set truetype(value:Boolean):void
		{
			_truetype = value;
		}

		private var _familyid:String;
		public function get familyid():String
		{
			return _familyid;
		}

		public function set familyid(value:String):void
		{
			_familyid = value;
		}

		private var _pitch:String;
		public function get pitch():String
		{
			return _pitch;
		}

		public function set pitch(value:String):void
		{
			_pitch = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);
			if (xml.@color)
			{
				this.color = xml.@color;
			}
			if (xml.@size)
			{
				this.size = xml.@size;
			}
			if (xml.@style)
			{
				this.style = xml.@style;
			}
			if (xml.@name)
			{
				this.name = xml.@name;
			}
			if (xml.@truetype)
			{
				if (xml.@truetype == "true")
				{
					this.truetype = true;
				} else
				{
					this.truetype = false;
				}
			} else
			{
				this.truetype = false;
			}

			if (xml.@familyid)
			{
				this.familyid = xml.@familyid;
			}

			if (xml.@pitch)
			{
				this.pitch = xml.@pitch;
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

			if (this.color)
			{
				xml.@color = xml.@color;
			}
			if (this.size)
			{
				xml.@size = xml.@size;
			}
			if (this.style)
			{
				xml.@style = xml.@style;
			}
			if (this.name)
			{
				xml.@name = xml.@name;
			}
			if (this.truetype)
			{
				xml.@truetype = "true";
			} else
			{
				xml.@truetype = "false";
			}
			if (this.familyid)
			{
				xml.@familyid = xml.@familyid;
			}
			if (this.pitch)
			{
				xml.@pitch = xml.@pitch;
			}


			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return new XML("");
		}
	}
}