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
	import interfaces.dominoComponents.IDominoButton;

	/**
	 * This class work for  convert from Visuale Button UI components to target framework of button format.
	 * Call different methods to convert the component to different target formats.
	 * For now:
	 * toCode() will convert the Visuale UI Button components to domino button  dxl format.
	 * toRoyaleConvertCode() will  convert the Visuale UI Button components to Rayale button format.
	 * For Test Input&Output:
	 * Input : - [Visuale UI main button component](https://github.com/Moonshine-IDE/MockupVisualEditor/blob/features/issue_675_royale_generate_domino_visual_editor/src/view/domino/surfaceComponents/components/DominoButton.as)
	 * Output example:  Domino - <button width='2in' widthtype='maximum' maxlines='1' wraptext='true' bgcolor='system'>
	 *					<code event='click'><formula>@URLOpen( "http://" + LoadBalancer_VirtualIP_Name + "/netmonitor.nsf/test?openform")</formula>
	 *					</code>Test LB</button>
	 * 				   Royale - <j:Button text="%ViewComponentLabel%" click="{dispatchEvent(new ScreenEvent(ScreenEvent.EVENT_NAVIGATE_TO, %ViewComponentName%.NAME))}"
	 * 					percentWidth="60"/>
	 * Domino format rule:	Contained by: %richtext.hot.inline;
	 *						Contains: <font>, <code>
	 */

	public class DominoButton extends ComponentBase implements IDominoButton, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "button";
		public static const ELEMENT_NAME:String = "button";
		public static const ROYALE_ELEMENT_NAME:String = "Button";

		public function DominoButton():void
		{
			super();
		}
		private var _codeevent:String;

		//Domino property
		private var _width:Number;

		override public function get width():Number
		{
			return _width;
		}

		override public function set width(value:Number):void
		{
			_width = value;
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

		private var _enabled:Boolean;

		public function get enabled():Boolean
		{
			return _enabled;
		}

		public function set enabled(value:Boolean):void
		{
			_enabled = value;
		}

		private var _label:String;

		public function get label():String
		{
			return _label;
		}

		//------------ font start------------------------

		public function set label(value:String):void
		{
			_label = value;
		}

		//Domino contain font
		private var _font:String;

		public function get font():String
		{
			return _font;
		}

		public function set font(value:String):void
		{
			_font = value;
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

		private var _code:String;

		public function get code():String
		{
			return _code;
		}

		public function set code(value:String):void
		{
			_code = value;
		}

		//minimum | maximum | fixed | fitcontent | fixedcharacter
		private var _widthtype:String;

		public function get widthtype():String
		{
			return _widthtype;
		}

		public function set widthtype(value:String):void
		{
			_widthtype = value;
		}

		private var _wraptext:Boolean;

		public function get wraptext():Boolean
		{
			return _wraptext;
		}

		public function set wraptext(value:Boolean):void
		{
			_wraptext = value;
		}

		private var _bgcolor:String;

		public function get bgcolor():String
		{
			return _bgcolor;
		}

		public function set bgcolor(value:String):void
		{
			_bgcolor = value;
		}

		//"normal | ok | cancel | help "
		private var _type:String;

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		private var _defaultValue:Boolean;

		public function get defaultValue():Boolean
		{
			return _defaultValue;
		}

		public function set defaultValue(value:Boolean):void
		{
			_defaultValue = value;
		}

		// <!ENTITY % button.edge.types "system | square | rounded ">
		private var _edge:String;

		public function get edge():String
		{
			return _edge;
		}

		public function set edge(value:String):void
		{
			_edge = value;
		}

		private var _characters:Number;

		public function get characters():Number
		{
			return _characters;
		}

		public function set characters(value:Number):void
		{
			_characters = value;
		}

		private var _maxlines:String;

		public function get maxlines():String
		{
			return _maxlines;
		}

		public function set maxlines(value:String):void
		{
			_maxlines = value;
		}

		public function get codeEvent():String
		{
			return _codeevent;
		}

		public function set codeEvent(value:String):void
		{
			_codeevent = value;
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

		//domino button still support html core property ,
		//%html.core.attrs; htmlid, htmlclass,htmlstyle,htmltitle,extrahtmlattrs

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);

			this.wraptext = xml.@wraptext == "false" ? true : false;
			this.defaultValue = xml.@default == "true" ? true : false;
			this.label = xml.@label;
			this.maxlines = xml.@maxlines;
			this.characters = xml.@characters;
			this.edge = xml.@edge;
			this.type = xml.@type;
			this.bgcolor = xml.@bgcolor;
			this.code = xml.@code;
			this.font = xml.@font;

			this.color = xml.@color;
			this.size = xml.@size;
			this.fontStyle = xml.@style;

			this.formula = xml.@formula;
			this.codeEvent = xml.@codeEvent;

		}

		/**
		 *Dxl example :
		 *<button width='2in' widthtype='maximum' maxlines='1' wraptext='true' bgcolor='system'>
		 *<code event='click'><formula>@URLOpen( "http://" + LoadBalancer_VirtualIP_Name + "/netmonitor.nsf/test?openform")</formula>
		 *</code>Test LB</button>
		 * code event:
		 * <!ENTITY % code.lotusscript.events "action | onhelp | queryopen | queryrecalc | postopen | querymodechange | querysend | postsend | postmodechange | postrecalc | querysave | postsave | queryclose | click | regiondoubleclick | queryopendocument | queryaddtofolder | querydragdrop | querypaste | postdragdrop | postpaste | onload | onunload | onsubmit | queryentryresize | postentryresize | %code.databasescript.lotusscript.or.formula.events; ">
		 */

		public function toCode():XML
		{
			var par_xml:XML = new XML("<par type=\"dominoField\"/>");
			if (this.label == null)
			{
				this.label = "default";
			}
			var xml:XML = new XML("<" + DOMINO_ELEMENT_NAME + ">" + this.label + "</" + DOMINO_ELEMENT_NAME + ">");
			if (this.width)
			{
				xml.@width = this.width + "pt";
			}

			if (this.widthtype)
			{
				xml.@widthtype = this.widthtype;
			}

			if (this.bgcolor)
			{
				xml.@bgcolor = this.bgcolor;
			}

			if (this.type)
			{
				xml.@type = this.type;
			}

			if (this.edge)
			{
				xml.@edge = this.edge;
			}

			if (this.characters)
			{
				xml.@characters = this.characters;
			}

			if (this.maxlines)
			{
				xml.@maxlines = this.maxlines;
			}

			var font_xml:XML = new XML("<font/>");
			var font_exist:Boolean = false;
			if (this.color)
			{
				font_xml.@color = this.color;
				font_exist = true;
			}

			if (this.size)
			{
				font_xml.@size = this.size + "pt";
				font_exist = true;
			}

			if (this.fontStyle)
			{
				font_xml.@style = this.fontStyle;
				font_exist = true;
			}
			if (font_exist)
			{
				xml.appendChild(font_xml);
			}

			if (this.code)
			{
				if (this.codeEvent == null)
				{
					this.codeEvent = "click";
				}
				var formual_string:String = "<formula>" + this.code + "</formula>";
				var code_string:String = "<code event=\"" + this.codeEvent + "\">" + formual_string + "</code>";

				//var code_xml:XML = new XML("<code event=\""+ this.codeEvent+"\"/>");
				//var formula_xml:XML=new XML("<formula>"+this.code+"</formula>");
				var code_xml:XML = new XML(code_string);
				xml.appendChild(code_xml);
			}


			par_xml.appendChild(xml);

			return par_xml;
		}

		/**
		 * Royale format examples
		 * <j:Button text="%ViewComponentLabel%" click="{dispatchEvent(new ScreenEvent(ScreenEvent.EVENT_NAVIGATE_TO, %ViewComponentName%.NAME))}"
		 * percentWidth="60"/>
		 */
		public function toRoyaleConvertCode():XML
		{
			var button_xml:XML = new XML("<" + ROYALE_ELEMENT_NAME + "/>");
			var royaleNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			button_xml.addNamespace(royaleNamespace);
			button_xml.setNamespace(royaleNamespace);

			if (this.label == null)
			{
				this.label = "default";
			}

			button_xml.@text = this.label
			return button_xml;
		}
	}
}