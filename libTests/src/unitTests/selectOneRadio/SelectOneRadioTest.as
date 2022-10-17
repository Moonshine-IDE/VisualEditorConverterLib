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