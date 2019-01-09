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
package unitTests.fieldset
{
    import events.ConverterErrorEvent;
    
    import loaders.TestConfigurationLoader;
    
    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;
    import interfaces.components.IFieldset;
    import components.primeFaces.Fieldset;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class FieldsetTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("fieldset", "FieldsetTest");

		[DataPoints(loader=dpDefaultLoader)]
        [ArrayElementType("vo.TestCaseVO")]
		public static var dpDefaultTest:Array;
		
		public static var dpDefaultLoader:TestConfigurationLoader = new TestConfigurationLoader("fieldset", "DefaultValuesTest");
		
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
        public function fieldsetExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.Fieldset;

            assertTrue("Example does not contain Fieldset", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function fieldsetPropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var fieldsetXML:XML = getFieldset(rootXML);

            var fieldsetComponent:IFieldset = new Fieldset();

            fieldsetComponent.fromXML(fieldsetXML, function(xml:XML):void
            {

            });

			assertTrue(fieldsetComponent.toggleable);
			assertTrue(isNaN(fieldsetComponent.duration) == false);
			assertEquals(fieldsetComponent.duration, 220);
			assertNotNull(fieldsetComponent.title);
        }

        [Test(dataProvider=dp, order="3")]
        public function fieldsetToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var fieldsetXML:XML = getFieldset(rootXML);

            var fieldsetComponent:IFieldset = new Fieldset();

            fieldsetComponent.fromXML(fieldsetXML, function(xml:XML):void
            {

            });

            var fieldsetHTML:XML = fieldsetComponent.toCode();

            assertEquals(String(fieldsetHTML.@legend), fieldsetComponent.title);
			assertEquals(String(fieldsetHTML.@toggleable) == "true", fieldsetComponent.toggleable == true);
			assertEquals(Number(fieldsetHTML.@toggleSpeed), fieldsetComponent.duration);
        }

		[Test(dataProvider=dpDefaultTest, order="4")]
        public function fieldsetToggleSpeedDefaultTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var fieldsetXML:XML = getFieldset(rootXML);

            var fieldsetComponent:IFieldset = new Fieldset();

            fieldsetComponent.fromXML(fieldsetXML, function(xml:XML):void
            {

            });

			assertEquals("No default value for toggleSpeed in fieldset", fieldsetComponent.duration, 200);
        }

        private function getFieldset(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.Fieldset;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
