////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) STARTcloud, Inc. 2015-2022. All rights reserved.
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
	import interfaces.dominoComponents.IDominoButton;
	import global.domino.DominoGlobals;

	/**
	 *  <p>Representation and converter for Visuale Button UI component</p>
	 * 
	 *  <p>This class work for  convert from Visuale Button UI components to target framework of button format.</p>
	 *  Conversion status<ul>
	 *   <li>Domino:  Complete</li>
	 *   <li>Royale:  Partial</li>
	 * </ul>
	 * 
	 * <p>Input:  view.domino.surfaceComponents.components.DominoButton</p>
	 * <p> Example Domino output:</p>
	 * <pre>
	 * &lt;button width=&#39;2in&#39; widthtype=&#39;maximum&#39; maxlines=&#39;1&#39; wraptext=&#39;true&#39; bgcolor=&#39;system&#39;&gt;
	 *	&lt;code event=&#39;click&#39;&gt;&lt;formula&gt;URLOpen( &quot;http://&quot; + LoadBalancer_VirtualIP_Name + &quot;/netmonitor.nsf/test?openform&quot;)&lt;/formula&gt;
	 *	&lt;/code&gt;Test LB&lt;/button&gt;
     * </pre>
	 * 
	 * <p> Example Royale output:</p>
	 * <pre>
	 * &lt;j:Button text="%ViewComponentLabel%" click="{dispatchEvent(new ScreenEvent(ScreenEvent.EVENT_NAVIGATE_TO, %ViewComponentName%.NAME))}"
	 * 	percentWidth="60"/&gt;
     * </pre>
	 *
	 * @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_BODY_ELEMENT_XML.html
	 * @see https://github.com/Moonshine-IDE/VisualEditorConverterLib/blob/master/src/components/domino/Body.as
	 */
	public class DominoButton extends DominoConponentHideBase implements IDominoButton, IRoyaleComponentConverter
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


		private var _height:Number;

		override public function get height():Number
		{
			return _height;
		}

		override public function set height(value:Number):void
		{
			_height = value;
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

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface,  lookup:ILookup):void
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
			this.hide = xml.@hide;

			this.color = xml.@color;
			this.size = xml.@size;
			this.fontStyle = xml.@style;

			this.formula = xml.@formula;
			this.codeEvent = xml.@codeEvent;
			this.height = xml.@height;

	

		}

		

		public function toCode():XML
		{
			var par_xml:XML 

			if(this.hide){
				par_xml	= new XML("<par type=\"dominoButton\" def=\""+DominoGlobals.PardefDivId+"\" hide=\""+this.hide+"\"/>");
			}else{
				par_xml	= new XML("<par type=\"dominoButton\" />");		
			}
			
		
			if (this.label == null)
			{
				this.label = "default";
			}
			var xml:XML = new XML("<" + DOMINO_ELEMENT_NAME + ">" + this.label + "</" + DOMINO_ELEMENT_NAME + ">");
			if (this.width)
			{
				xml.@width = this.width + "pt";
			}
			if (this.height)
			{
				xml.@height = this.height + "pt";
			}
			//for default height it is 30pt , but it show incorrect in the Notes client.
			//So , if the height is 30pt , we need remove it , so it can show correct default height in the Notes client.

			// if(xml.@height =="30pt"){
			// 	delete xml.@height;
			// }

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

			if(this.hide){
				xml.@hide= this.hide;
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


		public function toRoyaleConvertCode():XML
		{
			var buttonXML:XML = new XML("<" + ROYALE_ELEMENT_NAME + "/>");
			var royaleNamespace:Namespace = new Namespace("j", "library://ns.apache.org/royale/jewel");
			buttonXML.addNamespace(royaleNamespace);
			buttonXML.setNamespace(royaleNamespace);

			if (this.label == null)
			{
				this.label = "default";
			}

			buttonXML.@text = this.label;

			var beadsXML:XML = new XML("<beads />");
				beadsXML.setNamespace(royaleNamespace);

			var disabledXML:XML = new XML("<Disabled/>");
				disabledXML.setNamespace(royaleNamespace);
				disabledXML.@disabled = "{isDisabled}";

			beadsXML.appendChild(disabledXML);
			buttonXML.appendChild(beadsXML);

			return buttonXML;
		}
	}
}