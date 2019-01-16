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
package unitTests.textEditor
{
    import components.primeFaces.TextEditor;
    
    import events.ConverterErrorEvent;
    
    import interfaces.components.ITextEditor;
    
    import loaders.TestConfigurationLoader;
    
    import org.flexunit.asserts.assertEquals;
    import org.flexunit.asserts.assertFalse;
    import org.flexunit.asserts.assertNull;
    import org.flexunit.asserts.assertTrue;
    
    import unitTests.BaseTest;
    
    import utils.FileRepository;
    
    import vo.TestCaseVO;

    [TestCase]
    [RunWith("org.flexunit.runners.Parameterized")]
    public class TextEditorTest extends BaseTest
    {
        [DataPoints(loader=dpLoader)]
        [ArrayElementType("vo.TestCaseVO")]
        public static var dp:Array;
        public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("textEditor", "TextEditorTest");
		
		[DataPoints(loader=noTextDpLoader)]
		[ArrayElementType("vo.TestCaseVO")]
		public static var noTextDp:Array;
		public static var noTextDpLoader:TestConfigurationLoader = new TestConfigurationLoader("textEditor", "NoTextTextEditorTest");

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
        public function textEditorExistsTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var rootDiv:XMLList = rootXML.RootDiv.TextEditor;

            assertTrue("Example does not contain TextEditor", rootDiv.length() > 0);
        }

        [Test(dataProvider=dp, order="2")]
        public function textEditorPropertiesTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var textEditorXML:XML = getTextEditor(rootXML);

            var textEditor:ITextEditor = new TextEditor();

            textEditor.fromXML(textEditorXML, function(xml:XML):void
            {

            });
			
			assertTrue(textEditor.widgetVar.length > 0);
			assertTrue(textEditor.text.length > 0);
			assertTrue(textEditor.placeholder.length > 0);
        }

        [Test(dataProvider=dp, order="3")]
        public function textEditorToCodeTest(testCase:TestCaseVO):void
        {
            var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
            var textEditorXML:XML = getTextEditor(rootXML);

            var textEditor:ITextEditor = new TextEditor();

            textEditor.fromXML(textEditorXML, function(xml:XML):void
            {

            });

            var textEditorHTML:XML = textEditor.toCode();

			assertEquals(String(textEditorHTML.@widgetVar), textEditor.widgetVar);
			assertEquals(String(textEditorHTML.@placeholder), textEditor.placeholder);
        }
		
		[Test(dataProvider=noTextDp, order="4")]
		public function textPropertyIsNullTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var textEditorXML:XML = getTextEditor(rootXML);
			
			var textEditor:ITextEditor = new TextEditor();
			
			textEditor.fromXML(textEditorXML, function(xml:XML):void
			{
				
			});
			
			assertNull(textEditor.text);
		}
		
		[Test(dataProvider=noTextDp, order="5")]
		public function noTextPropertyToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var textEditorXML:XML = getTextEditor(rootXML);
			
			var textEditor:ITextEditor = new TextEditor();
			
			textEditor.fromXML(textEditorXML, function(xml:XML):void
			{
				
			});
			
			var textEditorHTML:XML = textEditor.toCode();
			assertFalse("@text" in textEditorHTML);
		}

        private function getTextEditor(xml:XML):XML
        {
            var rootDiv:XMLList = xml.RootDiv.TextEditor;

            if (rootDiv.length() > 0)
            {
                return XML(rootDiv);
            }

            return XML(rootDiv);
        }
    }
}
