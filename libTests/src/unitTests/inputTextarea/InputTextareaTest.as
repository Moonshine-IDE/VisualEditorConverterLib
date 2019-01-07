package unitTests.inputTextarea
{
	import components.primeFaces.InputTextarea;
	
	import events.ConverterErrorEvent;
	
	import interfaces.components.IInputTextarea;
	
	import loaders.TestConfigurationLoader;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	
	import unitTests.BaseTest;
	
	import utils.FileRepository;
	
	import vo.TestCaseVO;
	
	[TestCase]
	[RunWith("org.flexunit.runners.Parameterized")]
	public class InputTextareaTest extends BaseTest
	{
		[DataPoints(loader=dpLoader)]
		[ArrayElementType("vo.TestCaseVO")]
		public static var dp:Array;
		
		public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("inputTextarea", "InputTextareaTest");
		
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
		public function inputTextareaExistsTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var rootDiv:XMLList = rootXML.RootDiv.InputTextarea;
			
			assertTrue("Example does not contain InputTextarea", rootDiv.length() > 0);
		}
		
		[Test(dataProvider=dp, order="2")]
		public function inputTextareaPropertiesTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var buttonXML:XML = getTextInputarea(rootXML);
			
			var txt:IInputTextarea = new InputTextarea();
			
			txt.fromXML(buttonXML, function(xml:XML):void
			{
				
			});
			
			assertNotNull(txt.text);
			assertNotNull(txt.maxLength);
			assertNotNull(txt.idAttribute);
			assertNotNull(txt.counterTemplate);
			assertFalse(txt.required);
			assertFalse(txt.isAutoResize);
			assertTrue(txt.isCounterDisplay);
		}
		
		[Test(dataProvider=dp, order="3")]
		public function inputTextareaToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var buttonXML:XML = getTextInputarea(rootXML);
			
			var txt:IInputTextarea = new InputTextarea();
			
			txt.fromXML(buttonXML, function(xml:XML):void
			{
				
			});
			
			var txtHTML:XML = txt.toCode();
			
			assertEquals(String(txtHTML.@required) == "true", txt.required == true);
			assertEquals(String(txtHTML.@isAutoResize) == "true", txt.isAutoResize == true);
			assertEquals(String(txtHTML.@isCounterDisplay) == "false", txt.isCounterDisplay == false);
			assertEquals(String(txtHTML.@value), txt.text);
			assertEquals(String(txtHTML.@id), txt.idAttribute);
			assertEquals(String(txtHTML.@counterTemplate), txt.counterTemplate);
		}
		
		private function getTextInputarea(xml:XML):XML
		{
			var rootDiv:XMLList = xml.RootDiv.InputTextarea;
			
			if (rootDiv.length() > 0)
			{
				return XML(rootDiv);
			}
			
			return XML(rootDiv);
		}
	}
}