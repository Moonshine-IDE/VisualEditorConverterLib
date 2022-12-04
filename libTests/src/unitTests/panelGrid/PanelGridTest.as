////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) STARTcloud, Inc. 2015-2022. All rights reserved.
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
