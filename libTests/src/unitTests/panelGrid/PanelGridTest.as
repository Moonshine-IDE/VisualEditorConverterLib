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
package unitTests.panelGrid
{
    import components.primeFaces.PanelGrid;

    import events.ConverterErrorEvent;

    import interfaces.components.IPanelGrid;

    import loaders.TestConfigurationLoader;
    import org.flexunit.asserts.assertTrue;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class PanelGridTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("panelGrid", "PanelGridTest");

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
        public function panelGridExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.PanelGrid;

            assertTrue("Example does not contain PanelGrid", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function panelGridHeaderExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var header:XMLList = rootXML.RootDiv.PanelGrid.Header;
            var headersRow:XMLList = rootXML.RootDiv.PanelGrid.Header.Row;

            assertTrue("Example does not contain Header", header.length() > 0);
            assertTrue("Example does not contain rows in Header", headersRow.length() > 0);
        }

        [Test(dataProvider=dp, order="3")]
        public function panelGridRowsExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rows:XMLList = rootXML.RootDiv.PanelGrid.Row;
            var columns:XMLList = rootXML.RootDiv.PanelGrid.Row.Column;

            assertTrue("Example does not contain Rows", rows.length() > 0);
            assertTrue("Example does not contain Columns", columns.length() > 0);
        }

        [Test(dataProvider=dp, order="4")]
        public function panelGridPropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var panelGridXML:XML = getPanelGrid(rootXML);

            var pGrid:IPanelGrid = new PanelGrid();

            pGrid.fromXML(panelGridXML, function(xml:XML):void
            {

            });

            assertTrue(pGrid.hasHeader);
            assertTrue(pGrid.headerRowCount > 0);
            assertTrue(pGrid.columnCount > 0);
            assertTrue(pGrid.rowCount > 0);
            assertTrue(pGrid.headerRowTitles.length > 0);
        }

        [Test(dataProvider=dp, order="5")]
        public function panelGridToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var panelGridXML:XML = getPanelGrid(rootXML);

            var pGrid:IPanelGrid = new PanelGrid();

            pGrid.fromXML(panelGridXML, function(xml:XML):void
            {

            });

            var dtHTML:XML = pGrid.toCode();
            var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
            var facetNamespace:Namespace = new Namespace("f", "http://xmlns.jcp.org/jsf/core");
            var headerRows:XMLList = dtHTML.facetNamespace::facet;
            headerRows = headerRows[0].primeFacesNamespace::row;

            var columns:XMLList = dtHTML.primeFacesNamespace::row;
            columns = columns[0]..primeFacesNamespace::column;

            assertTrue(headerRows.length() > 0);
            assertTrue(columns.length() > 0);
        }

        private function getPanelGrid(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.PanelGrid;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
