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
	import components.DominoConponentHideBase;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoLabel;
	import com.adobe.utils.StringUtil;
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
		public static const ELEMENT_NAME:String = "Label";

		private static const AMPERSAND:String = "&amp;";
		private static const APOSTROPHE:String = "&apos;";
		private static const DBL_QUOTES:String = "&quot;";
		private static const GT:String = "&gt;";
		private static const LT:String = "&lt;";
		private static const SPACE:String = "&#160;";
		private static const TAB:String = "&#tab;";
		private static const LEFT_CURLY_BRACKET:String = "&#123;";
		private static const RIGHT_CURLY_BRACKET:String = "&#125;";

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
		//HTML
		private var _htmlId:String;
		public function get htmlId():String
		{
			return _htmlId;
		}
        public function set htmlId(value:String):void
		{
				_htmlId = value;
		}

		private var _htmlClass:String;
		public function get htmlClass():String
		{
			return _htmlClass;
		}
        public function set htmlClass(value:String):void
		{
			_htmlClass = value;
		}

		private var _htmlStyle:String;
		public function get htmlStyle():String
		{
			return _htmlStyle;
		}
        public function set htmlStyle(value:String):void
		{
			_htmlStyle=value;
		}

		private var _htmlTitle:String;
		public function get htmlTitle():String
		{
			return _htmlTitle;
		}
        public function set htmlTitle(value:String):void
		{
			_htmlTitle=value;
		}

		private var _htmlOther:String;
		public function get htmlOther():String
		{
			return _htmlOther;
		}
        public function set htmlOther(value:String):void
		{
			_htmlOther=value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			this.setComponentSize(xml);

			if (xml.children()[0] != null)
			{
				this.text = unescape(xml.children()[0].toString());
			} else
			{
				this.text = unescape(xml.toString());
			}
			if(xml.@htmlId){
				this.htmlId = xml.@htmlId
			}
			if(xml.@htmlClass){
				this.htmlClass = xml.@htmlClass
			}
			if(xml.@htmlTitle){
				this.htmlTitle = xml.@htmlTitle
			}
			if(xml.@htmlStyle){
				this.htmlStyle = xml.@htmlStyle
			}
			if(xml.@htmlOther){
				this.htmlOther = xml.@htmlOther
			}
			if(xml.@color){
				this.color = xml.@color;
			}

			this.color = xml.@color;
			this.size = xml.@size;
			this.fontStyle = xml.@fontStyle;
			this.fontName = xml.@fontName;

			this.formula = xml.@formula;
			this.hidewhen = xml.@hidewhen;
			this.hide = xml.@hide;

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
			var codeString:String = escapeSpecialCharactersDomino(unescape(this.text));

			var parXML:XML = new XML("<par/>");

			var fontXml:XML = new XML("<font/>");
			if (this.color!=null && this.color.length>0)
			{
				fontXml.@color = this.color;
			}

			if (this.size!= null && this.size.length>0)
			{
				fontXml.@size = this.size + "pt";
			}

			if (this.fontStyle !=null && this.fontStyle.length>0)
			{
				fontXml.@style = this.fontStyle;
			}

			if (this.fontName != null && this.fontName.length>0)
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
		

			var runXml:XML = new XML("<run>" + fontXml.toXMLString() + codeString + "</run>");
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

				var linkText:String = StringUtil.trim(fontXml.toXMLString()) + codeString;

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

	
			//HTML core attrs
			if(this.htmlId){
				parXML.@htmlid = this.htmlId;
			}
			if(this.htmlClass){
				parXML.@htmlclass = this.htmlClass;
			}
			if(this.htmlTitle){
				parXML.@htmltitle = this.htmlTitle;
			}
			if(this.htmlStyle){
				parXML.@htmlstyle = this.htmlStyle;
			}
			if(this.htmlOther){
				parXML.@htmlOther = this.htmlOther;
			}


			return parXML;
		}

		public function toRoyaleConvertCode():XML
		{
			var labelXML:XML = new XML("<" + ROYALE_ELEMENT_NAME + "/>");
			var royaleNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			labelXML.addNamespace(royaleNamespace);
			labelXML.setNamespace(royaleNamespace);

			var originalLabelText:String = this.text;
			var escapedLabelText:String = this.escapeSpecialCharactersRoyale(this.text);

			if (originalLabelText == escapedLabelText)
			{
				labelXML.@text = originalLabelText;
			}
			else
			{
				var htmlXML:XML = new XML("<html><![CDATA[" + escapedLabelText + "]]></html>");
					htmlXML.setNamespace(royaleNamespace);

				labelXML.appendChild(htmlXML);
			}

			labelXML.@className = "cursor-pointer";
			labelXML.@multiline = "true";

			return labelXML;

		}

		private function escapeSpecialCharactersDomino(text:String):String
		{
			var ampPattern:RegExp = /&/g;
			text = text.replace(ampPattern, AMPERSAND);

			var ltPattern:RegExp = /</g;
			text = text.replace(ltPattern, LT);
			var gtPattern:RegExp = />/g;
			text = text.replace(gtPattern, GT);

			var quotesPattern:RegExp = /"/g;
			text = text.replace(quotesPattern, DBL_QUOTES);

			var tabPattern:RegExp = /\t/g;
			text = text.replace(tabPattern, TAB);
			var aposPattern:RegExp = /'/g;
			text = text.replace(aposPattern, APOSTROPHE);

			//The first characters is space will lost in the format , because xml will auto remove the first space,
			//I guess any text content of node , will auto execute a trim() function.
			//So, in here , I convert the first normal space to non-break space.
			var space:RegExp = / /g;
			var lastSpace:RegExp = /.$/;
			if (text.substring(0, 1) == " ")
			{
				text = text.replace(space, SPACE);
			}

			if (text.substring(text.length - 1) == " ")
			{
				text = text.replace(lastSpace, SPACE);
			}

			return text
		}

		private function escapeSpecialCharactersRoyale(text:String):String
		{
			var ampPattern:RegExp = /&/g;
			text = text.replace(ampPattern, AMPERSAND);

			var ltPattern:RegExp = /</g;
			text = text.replace(ltPattern, LT);
			var gtPattern:RegExp = />/g;
			text = text.replace(gtPattern, GT);

			var quotesPattern:RegExp = /"/g;
			text = text.replace(quotesPattern, DBL_QUOTES);

			var leftCurlyBracketPattern:RegExp = /{/g;
			text = text.replace(leftCurlyBracketPattern, LEFT_CURLY_BRACKET);

			var rightCurlyBracketPattern:RegExp = /}/g;
			text = text.replace(rightCurlyBracketPattern, RIGHT_CURLY_BRACKET);

			return text;
		}
	}
}