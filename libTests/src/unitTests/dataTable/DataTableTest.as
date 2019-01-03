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
package dataTable
{
    import components.primeFaces.DataTable;

    import events.ConverterErrorEvent;

    import interfaces.components.IDataTable;

    import loaders.TestConfigurationLoader;

    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;

    import utils.FileRepository;

    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class DataTableTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("dataTable", "DataTableTest");

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
        public function dataTableExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.DataTable;
            var columns:XMLList = rootXML.RootDiv.DataTable.column;

            assertTrue("Example does not contain DataTable", rootDiv.length() > 0);
            assertTrue("Example does not contain column", columns.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function dataTablePropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var dropDownXML:XML = getDataTable(rootXML);

            var dt:IDataTable = new DataTable();

            dt.fromXML(dropDownXML, function(xml:XML):void
            {

            });

            assertNotNull(dt.emptyMessage);
            assertTrue(dt.paginator);
            assertTrue(dt.resizableColumns);
            assertNotNull(dt.tableValue);
            assertNotNull(dt.tableVar);
        }

        private function getDataTable(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.DataTable;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
