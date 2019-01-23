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
package unitTests.tree
{
    import components.primeFaces.Tree;
    
    import events.ConverterErrorEvent;
    
    import interfaces.components.ITree;
    
    import loaders.TestConfigurationLoader;
    
    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;
    import org.flexunit.asserts.assertFalse;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class TreeTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("tree", "TreeTest");

		[DataPoints(loader=dpNoPropertyLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dpNoProperty:Array;

        public static var dpNoPropertyLoader:TestConfigurationLoader = new TestConfigurationLoader("tree", "NoPropertyTreeTest");
		
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
        public function treeExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.Tree;

            assertTrue("Example does not contain Tree", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function treePropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var treeXML:XML = getTree(rootXML);

            var tree:ITree = new Tree();

			tree.fromXML(treeXML, function(xml:XML):void
            {

            });
			
			assertNotNull(tree.treeVar);
			assertNotNull(tree.treeValue);
        }

        [Test(dataProvider=dp, order="3")]
        public function treeToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var treeXML:XML = getTree(rootXML);
			
			var tree:ITree = new Tree();
			
			tree.fromXML(treeXML, function(xml:XML):void
			{
				
			});

            var treeHTML:XML = tree.toCode();
			
			assertEquals(String(treeHTML["@var"]), tree.treeVar);
			assertEquals(String(treeHTML.@value), tree.treeValue);
        }

		[Test(dataProvider=dpNoProperty)]
		public function noValuePropertyToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var treeXML:XML = getTree(rootXML);
			
			var tree:ITree = new Tree();
			
			tree.fromXML(treeXML, function(xml:XML):void
			{
				
			});

            var treeHTML:XML = tree.toCode();

			assertFalse("@value" in treeHTML);
		}
		
		[Test(dataProvider=dpNoProperty)]
		public function noVarPropertyToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var treeXML:XML = getTree(rootXML);
			
			var tree:ITree = new Tree();
			
			tree.fromXML(treeXML, function(xml:XML):void
			{
				
			});

            var treeHTML:XML = tree.toCode();

			assertFalse("@var" in treeHTML);
		}
		
        private function getTree(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.Tree;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
