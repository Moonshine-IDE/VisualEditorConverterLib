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

	import interfaces.dominoComponents.IDominoRun;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	/**
	* This class work for  convert from run element of Visuale label/text/field  components  to target framework of body format.
	* Call different methods to convert the component to different target formats.
	* For now: 
	* toCode() will convert the  run element    to domino calandar  dxl format.
	* toRoyaleConvertCode() - not work , the element only work for domino.
	* For Test Input&Output: 
	* Input : Visuale UI  run element   from Visual Editor
	* Output example:  Domino -  <run>{other some domino element}</run>
	* 				   Royale - TODO
	* 					
	* {@link #components.domino}
	* {@link #https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_RUN_ELEMENT_XML.html}
	
	 */
	public class DominoRun extends ComponentBase implements IDominoRun
	{
		public static const DOMINO_ELEMENT_NAME:String = "run";
        public static const ELEMENT_NAME:String = "run";
		
		public function DominoRun()
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
		
		private var _html:Boolean;
		public function get html():Boolean
		{
			return _html;
		}
		public function set html(value:Boolean):void
		{
			_html = value;
		}


		private var _highlight:String;
		public function get highlight():String
		{
			return _highlight;
		}
		public function set highlight(value:String):void
		{
			_highlight = value;
		}


		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			if(this.html){
				this.html = true;
			}else{
				this.html = false;
			}

			if(this.highlight){
				this.highlight = xml.@highlight;
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
		
			if (this.html)
            {
                xml.@html = "true";
            }else{
				xml.@html = "false";
			}

			if (this.highlight)
            {
                xml.@highlight = this.highlight;
            }

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{	
			return null;

		}


    }
}