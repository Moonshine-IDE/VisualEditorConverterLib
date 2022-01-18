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

	import interfaces.dominoComponents.IDominoPar;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

	/**
	* This class work for  convert from par element of Visuale label/text/field  components  to target framework of body format.
	* Call different methods to convert the component to different target formats.
	* For now: 
	* toCode() will convert the  par element    to domino calandar  dxl format.
	* toRoyaleConvertCode() will  convert the Visuale main container components to Rayale button format.
	* For Test Input&Output: 
	* Input : Visuale UI  par element   from Visual Editor
	* Output example:  Domino - <par isNewLine="false"></par>
	* 				   Royale - TODO
	* 					
	* {@link #components.domino}
	* @see https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_PARAGRAPH_ELEMENT_XML.html}
	
	 */
	public class DominoPar extends ComponentBase implements IDominoPar
	{
		public static const DOMINO_ELEMENT_NAME:String = "par";
        public static const ELEMENT_NAME:String = "par";

		public function DominoPar()
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
		
		private var _def:String;
		public function get def():String
		{
			return _def;
		}
		public function set def(value:String):void
		{
			_def = value;
		}


		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			if(this.def){
				this.def = xml.@def;
			}
		
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");
		
			if (this.def)
            {
                xml.@def = this.def;
            }

			return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}
    }
}