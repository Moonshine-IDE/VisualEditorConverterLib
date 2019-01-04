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
package unitTests.converter
{
    import events.ConverterErrorEvent;
    import events.ConverterEvent;
    
    import loaders.TestConfigurationLoader;
    
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.fail;
    import org.flexunit.async.Async;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class ConverterTest extends BaseTest
    {
        [DataPoints(loader=unknownItemLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var unknownItemDp:Array;

        public static var unknownItemLoader:TestConfigurationLoader = new TestConfigurationLoader("converter", "ConverterTest");

        [DataPoints(loader=knownItemLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var knownItemDp:Array;

        public static var knownItemLoader:TestConfigurationLoader = new TestConfigurationLoader("converter", "ConverterTestKnownItem");

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

        [Test(dataProvider=unknownItemDp, async, order="1")]
        public function converterTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);

            this.conversionCompletedHandler = Async.asyncHandler(this, this.converterTestHandler, 100,
                    {timeOut: "Timeout reached CONVERSION_COMPLETED"}, timeOutAsyncTest);
            componentsConverter.addEventListener(ConverterEvent.CONVERSION_COMPLETED, conversionCompletedHandler);

            componentsConverter.fromXMLOnly(rootXML);
        }

        [Test(dataProvider=unknownItemDp, async, order="2")]
        public function unknownItemDispatchTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);

            var conversionCompletedHandler:Function = Async.asyncHandler(this, this.unknownItemHandler, 100,
                    {timeOut: "Timeout reached UNKNOWN_CONVERSION_ITEM"}, timeOutUnknownItemTest);
            componentsConverter.addEventListener(ConverterEvent.UNKNOWN_CONVERSION_ITEM, conversionCompletedHandler);

            componentsConverter.fromXMLOnly(rootXML);
        }

        [Test(dataProvider=knownItemDp, async, order="3")]
        public function knownItemTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);

            var conversionCompletedHandler:Function = Async.asyncHandler(this, this.knownItemHandler, 20,
                    {timeOut: "Timeout reached UNKNOWN_CONVERSION_ITEM"}, timeOutKnownAsyncTest);
            componentsConverter.addEventListener(ConverterEvent.UNKNOWN_CONVERSION_ITEM, conversionCompletedHandler);

            componentsConverter.fromXMLOnly(rootXML);
        }

        private function unknownItemHandler(event:ConverterEvent, passThroughData:Object):void
        {
            assertNotNull(event.itemName);
        }

        protected function timeOutAsyncTest(passThroughData:Object):void
        {
            fail(passThroughData.timeOut);
        }

        protected function timeOutUnknownItemTest(passThroughData:Object):void
        {
            fail("No unknown item");
        }

        private function converterTestHandler(event:ConverterEvent, passThroughData:Object):void
        {
            assertNotNull("Conversion failed, cause there is no HTML output", event.xHtmlOutput);
        }

        private function knownItemHandler(event:ConverterEvent, passThroughData:Object):void
        {
            fail("Unknown item found, expected no unknown item. Name: " + event.itemName);
        }

        protected function timeOutKnownAsyncTest(passThroughData:Object):void
        {

        }
    }
}
