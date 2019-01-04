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
package unitTests
{
    import unitTests.autoComplete.AutoCompleteTest;

    import unitTests.button.ButtonTest;

    import unitTests.calendar.CalendarTest;

<<<<<<< HEAD
    import unitTests.selectOneListbox.SelectOneListboxTest;
=======
    import converter.ConverterTest;

    import dataTable.DataTableTest;

    import selectOneListbox.SelectOneListboxTest;
>>>>>>> 534af8449a7e8050e910b790d2bf06951b82cdb6

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class AllTestsSuite
    {
        public var converterTest:ConverterTest;
        public var buttonTest:ButtonTest;
        public var selectOneListboxTest:SelectOneListboxTest;
        public var autoCompleteTest:AutoCompleteTest;
        public var calendarTest:CalendarTest;
        public var dataTable:DataTableTest;
    }
}
