package unitTests.outputLabel
{
	import components.primeFaces.OutputLabel;
	
	import events.ConverterErrorEvent;
	
	import interfaces.components.IOutputLabel;
	
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
	public class OutputLabelTest extends BaseTest
	{
		[DataPoints(loader=dpLoader)]
		[ArrayElementType("vo.TestCaseVO")]
		public static var dp:Array;
		
		public static var dpLoader:TestConfigurationLoader = new TestConfigurationLoader("outputLabel", "OutputLabelTest");
		
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
		public function outputLabelExistsTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var rootDiv:XMLList = rootXML.RootDiv.OutputLabel;
			
			assertTrue("Example does not contain OutputLabel", rootDiv.length() > 0);
		}
		
		[Test(dataProvider=dp, order="2")]
		public function outputLabelPropertiesTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var buttonXML:XML = getOutputLabel(rootXML);
			
			var label:IOutputLabel = new OutputLabel();
			
			label.fromXML(buttonXML, function(xml:XML):void
			{
				
			});
			
			assertNotNull(label.text);
			assertNotNull(label.forAttribute);
			assertFalse(label.indicateRequired);
		}
		
		[Test(dataProvider=dp, order="3")]
		public function outputLabelToCodeTest(testCase:TestCaseVO):void
		{
			var rootXML:XML = FileRepository.getFileAsXML(testCase.testCaseBasePath, testCase.fileName);
			var buttonXML:XML = getOutputLabel(rootXML);
			
			var label:IOutputLabel = new OutputLabel();
			
			label.fromXML(buttonXML, function(xml:XML):void
			{
				
			});
			
			var labelHTML:XML = label.toCode();
			
			assertEquals(String(labelHTML.@indicateRequired) == "true", label.indicateRequired == true);
			assertEquals(String(labelHTML.@value), label.text);
			assertEquals(String(labelHTML["@for"]), label.forAttribute);
		}
		
		private function getOutputLabel(xml:XML):XML
		{
			var rootDiv:XMLList = xml.RootDiv.OutputLabel;
			
			if (rootDiv.length() > 0)
			{
				return XML(rootDiv);
			}
			
			return XML(rootDiv);
		}
	}
}