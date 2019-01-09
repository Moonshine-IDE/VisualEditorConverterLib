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
