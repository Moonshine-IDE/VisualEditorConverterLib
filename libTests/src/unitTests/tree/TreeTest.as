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

		[Test(dataProvider=dpNoProperty, order="4")]
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
		
		[Test(dataProvider=dpNoProperty, order="5")]
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
