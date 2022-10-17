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
	import global.domino.DominoGlobals;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
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

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);

			this.color = xml.@color;
			this.size = xml.@size;
			this.fontStyle = xml.@style;

			this.formula = xml.@formula;
			this.hidewhen = xml.@hidewhen;
			this.hide =  xml.@hide;
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