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
	import components.DominoConponentHideBase;

	import interfaces.ILookup;

	import interfaces.IRoyaleComponentConverter;
	import interfaces.ISurface;
	import interfaces.dominoComponents.IDominoSubForm;
	import com.adobe.utils.StringUtil;
	import global.domino.DominoGlobals;
    import utils.CodeMxmlUtils;
    import interfaces.IComponent;

    public class DominoSubForm extends DominoConponentHideBase implements IDominoSubForm, IRoyaleComponentConverter
	{
		public static const DOMINO_ELEMENT_NAME:String = "subformref";
		public static const ELEMENT_NAME:String = "SubFormRef";
        public function DominoSubForm(component:IComponent = null)
		{
			super();
            this._component = component;
		}

		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
        private var _component:IComponent;

		private function get component():IComponent
		{
			return _component ? _component : this;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		private var _subFormName:String;
		public function get subFormName():String
		{
			return _subFormName;
		}

		public function set subFormName(value:String):void
		{
			_subFormName = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
			
			if (this.subFormName)
			{
				this.subFormName = xml.@subFormName;
			}
		}

		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, DOMINO_ELEMENT_NAME) + "/>");

			if (this.subFormName)
			{
				xml.@name = this.subFormName;
			}
			delete xml["@class"];

			return xml;
		}

		public function toRoyaleConvertCode():XML
		{
			return null;

		}
    }
}