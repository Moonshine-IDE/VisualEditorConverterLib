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

package unitTests.selectOneMenu
{
    import components.primeFaces.SelectOneMenu;
    
    import events.ConverterErrorEvent;
    
    import interfaces.components.ISelectOneMenu;
    
    import loaders.TestConfigurationLoader;
    
    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertFalse;
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class SelectOneMenuTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("selectOneMenu", "SelectOneMenuTest");

 		[DataPoints(loader=noValueDpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var noValueDp:Array;

        public static var noValueDpLoader:TestConfigurationLoader = new TestConfigurationLoader("selectOneMenu", "NoValueSelectOneMenuTest");


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
        public function selectOneMenuExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.SelectOneMenu;
            var listItem:XMLList = rootXML.RootDiv.SelectOneMenu.selectItem;

            assertTrue("Example does not contain SelectOneMenu", rootDiv.length() > 0);
            assertTrue("SelectOneMenu deos not contain selectItem", listItem.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function selectOneMenuPropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var selectOneMenuXML:XML = getSelectOneMenu(rootXML);

            var selectMenu:ISelectOneMenu = new SelectOneMenu();

            selectMenu.fromXML(selectOneMenuXML, function(xml:XML):void
            {

            });

            assertNotNull(selectMenu.value);
            assertEquals(selectOneMenuXML.@value, selectMenu.value);
            assertNotNull(selectMenu.dataProvider);
            assertTrue(selectMenu.dataProvider.length > 0);
			assertFalse(selectMenu.editable);
        }

        [Test(dataProvider=dp, order="3")]
        public function selectOneMenuToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var selectOneMenuXML:XML = getSelectOneMenu(rootXML);

            var selectMenu:ISelectOneMenu = new SelectOneMenu();

            selectMenu.fromXML(selectOneMenuXML, function(xml:XML):void
            {

            });

            var selectMenuHTML:XML = selectMenu.toCode();
			
			assertEquals(String(selectMenuHTML.@editable) == "true", selectMenu.editable == true);
            assertEquals(String(selectMenuHTML.@value), selectMenu.value);
        }

		[Test(dataProvider=noValueDp, order="4")]
        public function noValueTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var selectOneMenuXML:XML = getSelectOneMenu(rootXML);

            var selectMenu:ISelectOneMenu = new SelectOneMenu();

            selectMenu.fromXML(selectOneMenuXML, function(xml:XML):void
            {

            });

            var selectMenuHTML:XML = selectMenu.toCode();

			var facetNamespace:Namespace = new Namespace("f", "http://xmlns.jcp.org/jsf/core");
			var items:XMLList = selectMenuHTML.facetNamespace::selectItem;
						
			assertTrue("There is no items in SelectOneMenu", items.length() > 0);
			
			for each (var item:XML in items)
			{
				assertFalse("@itemValue" in item);
			}
			
			assertFalse("@value" in selectMenuHTML);
        }

        private function getSelectOneMenu(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.SelectOneMenu;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}