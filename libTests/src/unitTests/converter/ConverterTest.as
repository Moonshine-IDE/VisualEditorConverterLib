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
