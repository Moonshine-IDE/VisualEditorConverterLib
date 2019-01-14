package unitTests.inputMask
{
	import components.primeFaces.InputMask;

	import events.ConverterErrorEvent;

	import interfaces.components.IInputMask;

	import loaders.TestConfigurationLoader;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	import unitTests.BaseTest;

	import utils.FileRepository;

	import vo.TestCaseVO;
	
	[TestCase]
	[RunWith("org.flexunit.runners.Parameterized")]
	public class InputMaskTest extends BaseTest
	{
		[DataPoints(loader=dpLoader)]
		[ArrayElementType("vo.TestCaseVO")]
		public static var dp:Array;
		
		public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("inputMask", "InputMaskTest");
		
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
		public function inputMaskExistsTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var rootDiv:XMLList = rootXML.RootDiv.InputMask;
			
			assertTrue("Example does not contain InputMask", rootDiv.length() > 0);
		}
		
		[Test(dataProvider=dp, order="2")]
		public function inputMaskPropertiesTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var inputMaskXML:XML = getInputMask(rootXML);
			
			var inputMaskComponent:IInputMask = new InputMask();
			
			inputMaskComponent.fromXML(inputMaskXML, function(xml:XML):void
			{
				
			});
	
			assertNotNull(inputMaskComponent.idAttribute);
			assertNotNull(inputMaskComponent.text);
			assertNotNull(inputMaskComponent.maskText);
			assertTrue(inputMaskComponent.required);
		}
		
		[Test(dataProvider=dp, order="3")]
		public function inputMaskToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var inputMaskXML:XML = getInputMask(rootXML);
			
			var inputMaskComponent:IInputMask = new InputMask();
			
			inputMaskComponent.fromXML(inputMaskXML, function(xml:XML):void
			{
				
			});
			
			var inputMaskHTML:XML = inputMaskComponent.toCode();
			
			assertEquals(String(inputMaskHTML.@value), inputMaskComponent.text);
			assertEquals(String(inputMaskHTML.@required) == "true", inputMaskComponent.required == true);
			assertEquals(String(inputMaskHTML.@id), inputMaskComponent.idAttribute);
			assertEquals(String(inputMaskHTML.@mask), inputMaskComponent.maskText);
		}
		
		private function getInputMask(xml:XML):XML
		{
			var rootDiv:XMLList = xml.RootDiv.InputMask;
			
			if (rootDiv.length() > 0)
			{
				return XML(rootDiv);
			}
			
			return XML(rootDiv);
		}
	}
}