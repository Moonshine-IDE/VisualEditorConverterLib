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
package unitTests.div
{
    import components.primeFaces.Div;

    import events.ConverterErrorEvent;

    import interfaces.components.IDiv;

    import loaders.TestConfigurationLoader;

    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;

    import unitTests.BaseTest;

    import utils.FileRepository;

    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class DivTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("div", "DivTest");

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
        public function divExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.Div;

            assertTrue("Example does not contain Div", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function divPropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var divXML:XML = getDiv(rootXML);

            var divContainer:IDiv = new Div();

			divContainer.fromXML(divXML, function(xml:XML):void
            {

            });
			
			assertNotNull(divContainer.cssClass);
        }

        [Test(dataProvider=dp, order="3")]
        public function divToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var divXML:XML = getDiv(rootXML);
			
			var divContainer:IDiv = new Div();
			
			divContainer.fromXML(divXML, function(xml:XML):void
			{
				
			});

            var divHTML:XML = divContainer.toCode();

			assertEquals(String(divHTML["@class"]), divContainer.cssClass);
        }

        private function getDiv(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.Div;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
