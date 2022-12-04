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

package unitTests.grid
{
    import events.ConverterErrorEvent;

    import loaders.TestConfigurationLoader;

    import org.flexunit.asserts.assertTrue;

    import unitTests.BaseTest;

    import utils.FileRepository;

    import vo.TestCaseVO;
    import interfaces.components.IGrid;
	import components.primeFaces.Grid;
	import org.flexunit.asserts.assertEquals;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class GridTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("grid", "GridTest");

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
        public function gridExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.Grid;
			
            assertTrue("Example does not contain Grid", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function gridRowsExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rows:XMLList = rootXML.RootDiv.Grid.Row;

            assertTrue("Grid does not contain any rows", rows.length() > 0);
        }

        [Test(dataProvider=dp, order="3")]
        public function gridColumnsExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rows:XMLList = rootXML.RootDiv.Grid.Row;
			var columns:XMLList = rows[0].Column;

			assertTrue("Grid does not contain any columns", columns.length() > 0);
        }

        [Test(dataProvider=dp, order="4")]
        public function gridToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var gridXML:XML = getGrid(rootXML);

            var gr:IGrid = new Grid();

            gr.fromXML(gridXML, function(xml:XML):void
            {

            });

            var dtHTML:XML = gr.toCode();
            var divs:XMLList = dtHTML.div;
			var div:XML = divs[0];
			
            assertEquals(div["@class"], "ui-g");
        }

        private function getGrid(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.Grid;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
