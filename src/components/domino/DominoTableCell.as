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

	import interfaces.dominoComponents.IDominoTableCell;

	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	import utils.StringHelperUtils;
    import components.enum.ColorName;

	/**
	* This class work for  convert from Visuale tableCell  components  to target framework of body format.
	* Call different methods to convert the component to different target formats.
	* For now: 
	* toCode() will convert the  Visuale tableCell  components     to domino tableCell  dxl format.
	* toRoyaleConvertCode() :TODO
	* For Test Input&Output: 
	* Input : Visuale UI  tableCell component   from Visual Editor
	* Output example:  Domino -  * <table widthtype="fitmargins" cellbordercolor="yellow" 				leftmargin="1in" cellborderstyle="ridge" 						colorstyle="solid" bgcolor="silver" insidewrap="true" 				insidewrapheight="1in"> 
	*			<border style="solid" width="2px" color="olive" 					dropshadow="true" /> 
	*			<tablecolumn width="66.58%" /> 
	*			<tablecolumn width="33.42%" /> 
	*			<tablerow> 
	*				<tablecell bgcolor="#e0ffbf"> 
	*					<pardef id="3" align="center" 									leftmargin="0.0313in" keepwithnext="true" 							keeptogether="true" /> 
	*					<par def="3"> 
	*						<picture height="341px" width="218px" 								alttext="caldesigns white two-piece 								dress"> 
	*							<imageref name="design1.jpg" /> 
	*							<caption>CALDesigns</caption>
	*						</picture> 
	*					</par> 
	*				</tablecell> 
	*				<tablecell colorstyle="vgradient" bgcolor="none" 						altbgcolor="#a1e2ff"> 
	*					<pardef id="4" align="center" 									leftmargin="0.0313in" keepwithnext="true" 							keeptogether="true" /> 
	*					<par def="4" /> 
	*					<pardef id="5" leftmargin="0.0313in" 							keepwithnext="true" keeptogether="true" /> 
	*					<par def="5"> 
	*						<run> 
	*							<font size="24pt" color="blue" /> 
	*							$250 
	*						</run> 
	*					</par> 
	*				</tablecell> 
	*			</tablerow> 
	*			<tablerow> 
	*				<tablecell bgcolor="#ffe1dc"> 
	*					<pardef id="6" leftmargin="0.0313in" 							keepwithnext="true" keeptogether="true" /> 
	*					<par def="6"> 
	*						<imagemap lastdefaultid="8" 									lastcircleid="1" lastrectangleid="55"> 
	*							<picture height="341px" width="219px" 									alttext="PERDesigns pink two-piece 									sleeveless dress"> 
	*								<border style="dot" width="1px" 										color="#ff4040" /> 
	*								<imageref name="design2.jpg" /> 
	*								<caption>PERDesigns</caption> 
	*							</picture> 
	*							<area type="circle" htmlid="bracelet">
	*								<point x="5" y="82" /> 
	*								<point x="81" y="158" /> 
	*								<urllink href="http://www.PERD
	*								esigns.com/jewelry" /> 
	*							</area> 
	*						</imagemap> 
	*					</par> 
	*				</tablecell> 
	*				<tablecell> 
	*					<cellbackground repeat="hrepeat"> 
	*						<imageref name="graphic.gif" /> 
	*					</cellbackground>
	*					<par def="5" /> 
	*					<par> 
	*						<run> 
	*							<font size="24pt" color="blue" /> 
	*							$300 
	*						</run> 
	*					</par> 
	*				</tablecell> 
	*			</tablerow> 
	*		</table> 
	*
	* 				   Royale - TODO
	* 					
	* {@link #components.domino}
	* {@link #https://help.hcltechsw.com/dom_designer/10.0.1/basic/H_TABLECELL_ELEMENT_XML.html}
	*/
	public class DominoTableCell extends ComponentBase implements IDominoTableCell
	{
        
        public function DominoTableCell()
		{
			super();
		}
        
        private var _bgcolor:ColorName;
		public function get bgcolor():ColorName
		{
			return _bgcolor;
		}
		public function set bgcolor(value:ColorName):void
		{
			_bgcolor = value;
		}

        private var _rowspan:Number;
		public function get rowspan():Number
		{
			return _rowspan;
		}
		public function set rowspan(value:Number):void
		{
			_rowspan = value;
		}


        private var _columnspan:Number;
        public function get columnspan():Number
		{
			return _columnspan;
		}
		public function set columnspan(value:Number):void
		{
			_columnspan = value;
		}

        private var _colorstyle:Number;
        public function get colorstyle():Number
		{
			return _colorstyle;
		}
		public function set colorstyle(value:Number):void
		{
			_colorstyle = value;
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