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
package button
{
    import components.primeFaces.Button;

    import converter.Converter;

    import events.ConverterErrorEvent;
    import events.ConverterEvent;

    import interfaces.components.IButton;

    import loaders.TestConfigurationLoader;

    import org.flexunit.asserts.assertFalse;

    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;
    import org.flexunit.async.Async;

    import utils.FileRepository;

    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class ButtonTest extends BaseConverterTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("button", "ButtonTest");

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
        public function buttonExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var buttonsMainApp:XMLList = rootXML.MainApplication.Button;
            var buttonsRootDiv:XMLList = rootXML.RootDiv.Button;

            assertTrue("Example does not contain Button: ", buttonsMainApp.length() > 0 || buttonsRootDiv.length() > 0);
        }

        [Test(dataProvider=dp, async, order="2")]
        public function buttonConverterTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);

            this.conversionCompletedHandler = Async.asyncHandler(this, this.buttonTestHandler, 100,
                    {timeOut: "Timeout reached CONVERSION_COMPLETED"}, timeOutAsyncTest);
            componentsConverter.addEventListener(ConverterEvent.CONVERSION_COMPLETED, conversionCompletedHandler);

            componentsConverter.fromXMLOnly(rootXML);
        }

        [Test(dataProvider=dp, order="3")]
        public function buttonPropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var buttonXML:XML = getButton(rootXML);

            var btn:IButton = new Button();

            btn.fromXML(buttonXML, function(xml:XML):void
            {

            });

            assertFalse(btn.enabled);
            assertNotNull(btn.actionListener);
            assertTrue(btn.actionListener.length > 0);
            assertNotNull(btn.toolTip);
            assertNotNull(btn.label);
        }

        private function buttonTestHandler(event:ConverterEvent, passThroughData:Object):void
        {
            assertNotNull("Button conversion failed, cause not output", event.xHtmlOutput);
        }

        private function getButton(xml:XML):XML
        {
            var buttonsMainApp:XMLList = xml.MainApplication.Button;
            var buttonsRootDiv:XMLList = xml.RootDiv.Button;

            if (buttonsMainApp.length() > 0)
            {
                return XML(buttonsMainApp);
            }

            return XML(buttonsRootDiv);
        }
    }
}
