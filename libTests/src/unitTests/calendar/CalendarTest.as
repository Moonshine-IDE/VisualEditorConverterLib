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
package unitTests.calendar
{
    import components.primeFaces.Calendar;
    
    import events.ConverterErrorEvent;
    
    import interfaces.components.ICalendar;
    
    import loaders.TestConfigurationLoader;
    
    import org.flexunit.assertThat;
    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class CalendarTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("calendar", "CalendarTest");

        private var modes:Array = ["popup", "inline"];

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
        public function calendarExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.Calendar;

            assertTrue("Example does not contain Calendar", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function calendarPropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var calendarXML:XML = getCalendar(rootXML);

            var cal:ICalendar = new Calendar();

            cal.fromXML(calendarXML, function(xml:XML):void
            {

            });

            assertNotNull(cal.pattern);
            assertNotNull(cal.maxDate);
            assertNotNull(cal.minDate);
            assertNotNull(cal.selectedDate);
            assertNotNull(cal.mode);
        }

        [Test(dataProvider=dp, order="3")]
        public function calendarModeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var calendarXML:XML = getCalendar(rootXML);

            var cal:ICalendar = new Calendar();

            cal.fromXML(calendarXML, function(xml:XML):void
            {

            });

            assertThat("Unrecognized calendar mode ".concat(cal.mode), modes.some(function(item:String, index:int, arr:Array):Boolean
            {
                return cal.mode == item;
            }));
        }

        [Test(dataProvider=dp, order="4")]
        public function calendarToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var calendarXML:XML = getCalendar(rootXML);

            var cal:ICalendar = new Calendar();

            cal.fromXML(calendarXML, function(xml:XML):void
            {

            });

            var calHTML:XML = cal.toCode();

            assertEquals(String(calHTML.@mode), cal.mode);
            assertEquals(String(calHTML.@pattern), cal.pattern);
            assertEquals(String(calHTML.@minDate), cal.minDate);
            assertEquals(String(calHTML.@maxDate), cal.maxDate);
            assertEquals(String(calHTML.@value), cal.selectedDate);
        }

        private function getCalendar(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.Calendar;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
