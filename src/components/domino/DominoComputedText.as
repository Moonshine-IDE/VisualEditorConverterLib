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
	import global.domino.DominoGlobals;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.dominoComponents.IDominoComputedText;

	/**
	 *  <p>Representation and converter for Visuale computed text  components </p>
	 * 
	 *  <p>This class work for  convert from Visuale input  components to target framework of body format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  TODO</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoComputedText</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 *  &lt;par def=&#39;6&#39;&gt;&lt;run&gt;&lt;font color=&#39;blue&#39;/&gt;example string .....&lt;/run&gt;&lt;/par&gt;
     * </pre>
	 * 
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoComputedText.as
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_COMPUTEDTEXT_ELEMENT_XML.html
	 */

	public class DominoComputedText extends DominoConponentHideBase implements IDominoComputedText, IRoyaleComponentConverter
	{
		public static const ELEMENT_NAME:String = "ComputedText";
		public static const AMPERSAND:String = "&amp;"
		public static const APOSTROPHE:String = "&apos;"
		public static const DBL_QUOTES:String = "&quot;"
		public static const GT:String = "&gt;"

		//------------comenent start------------------
		public static const LT:String = "&lt;"

		public function DominoComputedText()
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

		private var _hidewhen:String;

		public function get hidewhen():String
		{
			return _hidewhen;
		}

		public function set hidewhen(value:String):void
		{
			_hidewhen = value;
		}

		private var _font:DominoFont;

		public function get font():DominoFont
		{
			return _font;
		}

		public function set font(font:DominoFont):void
		{
			_font = font;
		}

		private var _par:DominoPar;

		public function get par():DominoPar
		{
			return _par;
		}

		public function set par(par:DominoPar):void
		{
			_par = par;
		}

		private var _run:DominoRun;

		//------------ font start------------------------

		public function get run():DominoRun
		{
			return _run;
		}

		public function set run(run:DominoRun):void
		{
			_run = run;
		}

		private var _formula:String;

		public function get formula():String
		{
			return _formula;
		}

		public function set formula(value:String):void
		{
			_formula = value;
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

		private var _color:String;

		public function get color():String
		{
			return _color;
		}

		public function set color(value:String):void
		{
			_color = value;
		}

		private var _fontStyle:String;

		public function get fontStyle():String
		{
			return _fontStyle;
		}

		public function set fontStyle(value:String):void
		{
			_fontStyle = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			this.color = xml.@color;
			this.size = xml.@size;
			this.fontStyle = xml.@style;

			this.formula = xml.@formula;
			this.hidewhen = xml.@hidewhen;
		}

		public function toCode():XML
		{

			//for domino input field element must contain into par node
			//var code_string:String=fixSpecailCharacter(this.text)
			var par_xml:XML
			if(this.hide){
				par_xml = new XML("<par dominotype=\"computedtext\" def=\""+DominoGlobals.PardefDivId+"\" hide=\""+this.hide+"\"/>");
			}else{
				par_xml = new XML("<par dominotype=\"computedtext\"/>");
			}
			
			var xml:XML = new XML("<computedtext/>");
			if (this.formula == null || this.formula == "")
			{
				this.formula = " "
			}

			if(this.hide){
				xml.@hide=this.hide;
			}

			var code_xml:XML = new XML("<code event=\"value\"/>");
			var formula_xml:XML = new XML("<formula>" + this.formula + "</formula>");
			code_xml.appendChild(formula_xml);
			xml.appendChild(code_xml);
			par_xml.appendChild(xml);


			return par_xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return new XML("");
		}

		private function fixSpecailCharacter(text:String):String
		{
			var amppattern:RegExp = /&/g;
			text = text.replace(amppattern, AMPERSAND);

			var ltpattern:RegExp = /</g;
			text = text.replace(ltpattern, LT);
			var gtpattern:RegExp = />/g;
			text = text.replace(gtpattern, GT);

			var qtpattern:RegExp = /"/g;
			text = text.replace(qtpattern, DBL_QUOTES);


			var aposattern:RegExp = /'/g;
			text = text.replace(aposattern, APOSTROPHE);

			return text


		}
	}
}