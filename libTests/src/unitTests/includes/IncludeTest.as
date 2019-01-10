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
package unitTests.includes
{
    import components.primeFaces.Include;
    
    import events.ConverterErrorEvent;
    
    import interfaces.components.IInclude;
    
    import loaders.TestConfigurationLoader;
    
    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertNotNull;
    import org.flexunit.asserts.assertTrue;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class IncludeTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;

        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("include", "IncludeTest");

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
        public function includeExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.Include;

            assertTrue("Example does not contain Include", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function includePropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var includeXML:XML = getInclude(rootXML);

            var inc:IInclude = new Include();

			inc.fromXML(includeXML, function(xml:XML):void
            {

            });
			
			assertNotNull(inc.path);
        }

        [Test(dataProvider=dp, order="3")]
        public function IncludeToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var includeXML:XML = getInclude(rootXML);
			
			var inc:IInclude = new Include();
			
			inc.fromXML(includeXML, function(xml:XML):void
			{
				
			});

            var includeHTML:XML = inc.toCode();

			assertEquals(String(includeHTML.@src), inc.path);
        }

        private function getInclude(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.Include;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
