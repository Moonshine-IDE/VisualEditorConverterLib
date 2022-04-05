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

	import interfaces.IRoyaleComponentConverter;
	import interfaces.dominoComponents.IDominoLabel;
	import com.adobe.utils.StringUtil;
	import interfaces.IDominoVisualHideOption;
	import global.domino.DominoGlobals;
	

	/**
	 *  <p>Representation and converter for Visuale label  components </p>
	 * 
	 *  <p>This class work for  convert from Visuale label  components to target framework of domino format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  Partial</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoLabel</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 * &lt;par isNewLine=&quot;false&quot;&gt;
	 * 	&lt;run&gt;
	 *	 &lt;font color=&quot;system&quot; size=&quot;12pt&quot; style=&quot;normal&quot;/&gt;Label
	 *	&lt;/run&gt;
	 *	&lt;/par&gt;
	 * </pre> 
	 *
	 * <p> Example Royale output:</p>
	 * <pre>
	 * TODO
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_TEXT_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/DominoLabel.as
	 */

	
	public class DominoLabel extends DominoConponentHideBase implements IDominoLabel, IRoyaleComponentConverter
	{
		public static const ROYALE_ELEMENT_NAME:String = "Label";
		public static const AMPERSAND:String = "&amp;"
		public static const APOSTROPHE:String = "&apos;"
		public static const DBL_QUOTES:String = "&quot;"
		public static const GT:String = "&gt;"
		public static const LT:String = "&lt;"
		public static const SPEACE:String = "&#160;"
		public static const TAB:String = "&#9;"

		public function DominoLabel()
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

		//------------comenent start------------------
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

		//-------------other componetn end-------------

		public function set par(par:DominoPar):void
		{
			_par = par;
		}

		private var _run:DominoRun;

		public function get run():DominoRun
		{
			return _run;
		}

		//------------ font start------------------------

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

		private var _text:String;

		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
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

		private var _fontName:String;

		public function get fontName():String
		{
			return _fontName;
		}

		//showborder

		public function set fontName(value:String):void
		{
			_fontName = value;
		}

		private var _isUrlLink:String;

		public function get isUrlLink():String
		{
			return _isUrlLink;
		}

		public function set isUrlLink(value:String):void
		{
			_isUrlLink = value;
		}

		private var _urlLinkHref:String;

		public function get urlLinkHref():String
		{
			return _urlLinkHref;
		}

		public function set urlLinkHref(value:String):void
		{
			_urlLinkHref = value;
		}

		private var _showBorder:String;

		public function get showBorder():String
		{
			return _showBorder;
		}

		public function set showBorder(value:String):void
		{
			_showBorder = value;
		}

		private var _isNewLine:String;

		public function get isNewLine():String
		{
			return _isNewLine;
		}

		public function set isNewLine(value:String):void
		{
			_isNewLine = value;
		}

		private var _isBreak:String;

		public function get isBreak():String
		{
			return _isBreak;
		}

		public function set isBreak(value:String):void
		{
			_isBreak = value;
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

		private var _truetype:String;

		public function get truetype():String
		{
			return _truetype;
		}

		public function set truetype(value:String):void
		{
			_truetype = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			if (xml.children()[0] != null)
			{
				this.text = unescape(xml.children()[0].toString());
			} else
			{
				this.text = unescape(xml.toString());
			}

			this.color = xml.@color;
			this.size = xml.@size;
			this.fontStyle = xml.@style;
			this.fontName = xml.@name;

			this.formula = xml.@formula;
			this.hidewhen = xml.@hidewhen;

			this.isUrlLink = xml.@isUrlLink;
			this.urlLinkHref = xml.@urlLinkHref;
			this.showBorder = xml.@showborder;

			this.pitch = xml.@pitch;
			this.familyid = xml.@familyid;

			if (xml.@truetype)
			{
				this.truetype = xml.@truetype;
			}

			if (xml.@isNewLine)
			{
				this.isNewLine = xml.@isNewLine;
			}
			else
			{
				this.isNewLine = "false";
			}
			if (xml.@isBreak)
			{
				this.isBreak = xml.@isBreak;
			} else
			{
				this.isBreak = "false";
			}
		}

		public function toCode():XML
		{
			var code_string:String = fixSpecailCharacter(unescape(this.text));

			var parXML:XML = new XML("<par/>");

			var fontXml:XML = new XML("<font/>");
			if (this.color)
			{
				fontXml.@color = this.color;
			}

			if (this.size)
			{
				fontXml.@size = this.size + "pt";
			}

			if (this.fontStyle)
			{
				fontXml.@style = this.fontStyle;
			}

			if (this.fontName)
			{
				fontXml.@name = this.fontName;
			}

			if (this.pitch)
			{
				fontXml.@pitch = this.pitch;
			}

			if (this.truetype)
			{
				fontXml.@truetype = this.truetype;
			}

			if (this.familyid)
			{
				fontXml.@familyid = this.familyid;
			}

			var xml:XML = new XML();

			//CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			//Alert.show("code_string 2:"+code_string+":");
			var runXml:XML = new XML("<run>" + fontXml.toXMLString() + code_string + "</run>");
			var rex:RegExp = /(\t|\n|\r)/gi;
			if (this.par != null)
			{
				if (this.par.def != null)
				{
					parXML.@def = this.par.def;
				}
			}

			if (this.isUrlLink == "true")
			{
				//craete  a new link node
				var linkXml:XML = new XML("<urllink></urllink>");
				linkXml.@href = this.urlLinkHref;
				linkXml.@showborder = this.showBorder;

				var linkText:String = StringUtil.trim(fontXml.toXMLString()) + code_string;

				linkText = linkText.replace(rex, '');
				var linkRunXML:XML = new XML("<run>" + linkText + "</run>");
				linkXml.appendChild(linkRunXML);
				parXML.appendChild(linkXml);

			} else
			{
				//no link direction add the run node
				if (this.isBreak == "true")
				{
					parXML = new XML("<break/>");
				} else if (this.isNewLine == "true")
				{
					var blankRunXml:XML = new XML("<run></run>");
					var blankFontXml:XML = new XML("<font color=\"system\" size=\"12pt\" style=\"normal\"/>");
					blankRunXml.appendChild(blankFontXml);
					//blankRunXml.appendChild(new XML("     "));
					parXML.appendChild(blankRunXml);
					parXML.@isNewLine = "true";
					parXML.@paragraph = "true";
				} else
				{
					parXML.appendChild(runXml);
					parXML.@isNewLine = "false";
				}

			}

			if (this.hidewhen)
			{
				parXML.@hidewhen = this.hidewhen;
				parXML.@dominotype = "label";
			}

			if (this.hide)
			{
				parXML.@hide = this.hide;
				parXML.@def = DominoGlobals.PardefDivId;
			}



			return parXML;
		}

		public function toRoyaleConvertCode():XML
		{
			var code_string:String = fixSpecailCharacter(unescape(this.text));
			var label_xml:XML = new XML("<" + ROYALE_ELEMENT_NAME + "/>");
			var royaleNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			label_xml.addNamespace(royaleNamespace);
			label_xml.setNamespace(royaleNamespace);

			label_xml.@text = code_string;
			label_xml.@className = "cursor-pointer";
			label_xml.@multiline = "true";

			return label_xml;

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


			var tabpattern:RegExp = /\t/g;
			text = text.replace(tabpattern, "&#tab;");
			var aposattern:RegExp = /'/g;
			text = text.replace(aposattern, APOSTROPHE);

			//The first characters is space will lost in the format , because xml will auto remove the first space,
			//I guess any text content of node , will auto execute a trim() function.
			//So, in here , I convert the first normal space to non-break space.
			var speace:RegExp = / /g;
			var lastspeace:RegExp = /.$/;
			if (text.substring(0, 1) == " ")
			{
				text = text.replace(speace, SPEACE);
			}

			if (text.substring(text.length - 1) == " ")
			{
				text = text.replace(lastspeace, SPEACE);
			}

			return text
		}
	}
}