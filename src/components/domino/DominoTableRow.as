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

    import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;

    import interfaces.dominoComponents.IDominoTableRow;

    import components.enum.CellBackgroundRepeat;

    /** 
	 * Domino table element dxl format 
	*/
	public class DominoTableRow extends ComponentBase implements IDominoTableRow
	{
        
		public function DominoTableRow()
		{
			super();
		}
        
		
		private var _tablabel:String;
		public function get tablabel():String
		{
			return _tablabel;
		}
		public function set tablabel(value:String):void
		{
			_tablabel = value;
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


		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
		}

		public function toCode():XML
		{
			  var xml:XML = new XML("<tablerow/>");

			  return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}

    }

}