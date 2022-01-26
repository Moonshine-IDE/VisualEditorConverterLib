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
	import interfaces.dominoComponents.IMainApplication;
	import components.common.RootDiv;

	/**
	* This class work for  convert from Visuale main container components to target framework of body format.
	* Call different methods to convert the component to different target formats.
	* For now: 
	* toCode() will convert the Visuale main container components to domino button  dxl format.
	* toRoyaleConvertCode() will  convert the Visuale main container components to Rayale button format.
	* For Test Input&Output: 
	* Input : Visuale UI main container component from Visual Editor
	* Output example:  Domino - <itme name="$Body" sign="true"><richtext></richtext></item>
	* 				   Royale - <j:ApplicationMainContent><j:ScrollableSectionConten></j:ScrollableSectionCont></j:ApplicationMainContent>
	* 					
	* {@link #components.domino}
    */
	public class MainApplication extends RootDiv implements IMainApplication
	{
		public function MainApplication()
		{
			super();
		}

		private var _title:String;
		public function get title():String
		{
			return _title;
		}
		public function set title(value:String):void
		{
			_title = value;
		}
	}
}