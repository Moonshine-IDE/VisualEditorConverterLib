package unitTests.inputText
{
	import components.primeFaces.InputText;
	
	import events.ConverterErrorEvent;
	
	import interfaces.components.IInputText;
	
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
	public class InputTextTest extends BaseTest
	{
		[DataPoints(loader=dpLoader)]
		[ArrayElementType("vo.TestCaseVO")]
		public static var dp:Array;
		
		public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("inputText", "InputTextTest");
		
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
		public function inputTextExistsTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var rootDiv:XMLList = rootXML.RootDiv.InputText;
			
			assertTrue("Example does not contain InputText", rootDiv.length() > 0);
		}
		
		[Test(dataProvider=dp, order="2")]
		public function inputTextPropertiesTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var inputTextXML:XML = getTextInput(rootXML);
			
			var txt:IInputText = new InputText();
			
			txt.fromXML(inputTextXML, function(xml:XML):void
			{
				
			});
			
			assertNotNull(txt.text);
			assertNotNull(txt.maxLength);
			assertNotNull(txt.idAttribute);
			assertFalse(txt.required);
		}
		
		[Test(dataProvider=dp, order="3")]
		public function inputTextToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var inputTextXML:XML = getTextInput(rootXML);
			
			var txt:IInputText = new InputText();
			
			txt.fromXML(inputTextXML, function(xml:XML):void
			{
				
			});
			
			var txtHTML:XML = txt.toCode();
			
			assertEquals(String(txtHTML.@required) == "true", txt.required == true);
			assertEquals(String(txtHTML.@value), txt.text);
			assertEquals(String(txtHTML.@id), txt.idAttribute);
		}
		
		private function getTextInput(xml:XML):XML
		{
			var rootDiv:XMLList = xml.RootDiv.InputText;
			
			if (rootDiv.length() > 0)
			{
				return XML(rootDiv);
			}
			
			return XML(rootDiv);
		}
	}
}