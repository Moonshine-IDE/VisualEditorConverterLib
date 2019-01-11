////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package unitTests.selectOneRadio
{
	import components.primeFaces.SelectOneRadio;

	import events.ConverterErrorEvent;

	import interfaces.components.ISelectOneRadio;

	import loaders.TestConfigurationLoader;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	import unitTests.BaseTest;

	import utils.FileRepository;

	import vo.TestCaseVO;
	import org.flexunit.asserts.assertFalse;
	
	[TestCase]
	[RunWith("org.flexunit.runners.Parameterized")]
	public class SelectOneRadioTest extends BaseTest
	{
		[DataPoints(loader=dpLoader)]
		[ArrayElementType("vo.TestCaseVO")]
		public static var dp:Array;
		
		public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("selectOneRadio", "SelectOneRadioTest");
		
		[DataPoints(loader=noValueDpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var noValueDp:Array;

        public static var noValueDpLoader:TestConfigurationLoader = new TestConfigurationLoader("selectOneRadio", "NoValueSelectOneRadioTest");

		
		[Before]
		override public function setUpTest():void
		{
			super.setUpTest();
			
			this.conversionFailedHandler = this.defaultConversionFailedHandler;
			componentsConverter.addEventListener(ConverterErrorEvent.CONVERSION_FAILED, this.conversionFailedHandler);
		}
		
		[After]
		override public function tearDownTest():void
		{
			super.tearDownTest();
		}
		
		[Test(dataProvider=dp, order="1")]
		public function selectOneListboxExistsTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var rootDiv:XMLList = rootXML.RootDiv.SelectOneRadio;
			var listItem:XMLList = rootXML.RootDiv.SelectOneRadio.selectItem;
			
			assertTrue("Example does not contain SelectOneRadio", rootDiv.length() > 0);
			assertTrue("SelectOneRadio deos not contain selectItem", listItem.length() > 0);
		}
		
		[Test(dataProvider=dp, order="2")]
		public function selectOneRadioPropertiesTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var selectOneRadioXML:XML = getSelectOneRadio(rootXML);
			
			var radio:ISelectOneRadio = new SelectOneRadio();
			
			radio.fromXML(selectOneRadioXML, function(xml:XML):void
			{
				
			});
			
			assertNotNull(radio.value);
			assertEquals(selectOneRadioXML.@value, radio.value);
		}
		
		[Test(dataProvider=dp, order="3")]
		public function selectOneRadioToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var selectOneRadioXML:XML = getSelectOneRadio(rootXML);
			
			var radio:ISelectOneRadio = new SelectOneRadio();
			
			radio.fromXML(selectOneRadioXML, function(xml:XML):void
			{
				
			});
			
			var selectOneRadioHTML:XML = radio.toCode();
			
			assertEquals(String(selectOneRadioHTML.@value), radio.value);
		}
		
		[Test(dataProvider=noValueDp, order="4")]
        public function noValueTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var selectOneRadioXML:XML = getSelectOneRadio(rootXML);
			
			var radio:ISelectOneRadio = new SelectOneRadio();
			
			radio.fromXML(selectOneRadioXML, function(xml:XML):void
			{
				
			});
			
			var selectOneRadioHTML:XML = radio.toCode();

			var facetNamespace:Namespace = new Namespace("f", "http://xmlns.jcp.org/jsf/core");
			var items:XMLList = selectOneRadioHTML.facetNamespace::selectItem;
						
			assertTrue("There is no items in SelectOneRadio", items.length() > 0);
			
			for each (var item:XML in items)
			{
				assertFalse("@itemValue" in item);
			}
			
			assertFalse("@value" in selectOneRadioHTML);
        }
		
		private function getSelectOneRadio(xml:XML):XML
		{
			var rootDiv:XMLList = xml.RootDiv.SelectOneRadio;
			
			if (rootDiv.length() > 0)
			{
				return XML(rootDiv);
			}
			
			return XML(rootDiv);
		}
	}
}