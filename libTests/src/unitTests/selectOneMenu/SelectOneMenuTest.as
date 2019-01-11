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