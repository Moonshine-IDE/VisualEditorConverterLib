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
package autoComplete
{
    import components.primeFaces.AutoCompleteDropDownList;
    import events.ConverterErrorEvent;

    import interfaces.components.IAutoCompleteDropDownList;


    import loaders.TestConfigurationLoader;

    import org.flexunit.asserts.assertEquals;

    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;

    import utils.FileRepository;

    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class AutoCompleteTest extends BaseConverterTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("autoComplete", "AutoCompleteTest");

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
        public function autoCompleteExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.DropDownList;

            assertTrue("Example does not contain AutoComplete", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, async, order="2")]
        override public function converterTest(testCase:TestCaseVO):void
        {
            super.converterTest(testCase);
        }

        [Test(dataProvider=dp, order="3")]
        public function autoCompletePropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var dropDownXML:XML = getDropDown(rootXML);

            var dropDown:IAutoCompleteDropDownList = new AutoCompleteDropDownList();

            dropDown.fromXML(dropDownXML, function(xml:XML):void
            {

            });

            assertTrue(dropDown.isDropDown);
            assertNotNull(dropDown.value);
            assertEquals(dropDownXML.@value,  dropDown.value);
            assertNotNull(dropDown.converter);
            assertNotNull(dropDown.completeMethod);
            assertNotNull(dropDown.fieldVar);
            assertNotNull(dropDown.itemLabel);
            assertNotNull(dropDown.itemValue);
            assertTrue(dropDown.multiple);
        }

        private function getDropDown(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.DropDownList;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
