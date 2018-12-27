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
    import events.ConverterErrorEvent;
    import events.ConverterEvent;

    import loaders.TestConfigurationLoader;

    import org.flexunit.asserts.assertNotNull;
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
            converter.addEventListener(ConverterErrorEvent.CONVERSION_FAILED, this.conversionFailedHandler);
        }

        [After]
        override public function tearDownTest():void
        {
            super.tearDownTest();
        }

        [Test(dataProvider=dp, async)]
        public function buttonTest(testCase:TestCaseVO):void
        {
            var buttonXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);

            this.conversionCompletedHandler = Async.asyncHandler(this, this.buttonTestHandler, 100,
                    {timeOut: "Timeout reached CONVERSION_COMPLETED"}, timeOutAsyncTest);
            converter.addEventListener(ConverterEvent.CONVERSION_COMPLETED, conversionCompletedHandler);

            converter.fromXMLOnly(buttonXML);
        }

        private function buttonTestHandler(event:ConverterEvent, passThroughData:Object):void
        {
            assertNotNull("Button conversion failed, cause not output", event.xHtmlOutput);
        }
    }
}
