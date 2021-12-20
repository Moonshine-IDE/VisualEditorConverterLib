package components.primeFaces
{
	import components.ComponentBase;
	
	import interfaces.components.ITree;
	
	import utils.CodeMxmlUtils;
	import utils.CodeXMLUtils;
	
	public class Tree extends ComponentBase implements ITree
	{
		public static const PRIME_FACES_XML_ELEMENT_NAME:String = "tree";
		public static const ELEMENT_NAME:String = "Tree";
		
		private var _treeVar:String;
		public function get treeVar():String
		{
			return _treeVar;
		}
		public function set treeVar(value:String):void
		{
			_treeVar = value;
		}
		
		private var _treeValue:String;
		public function get treeValue():String
		{
			return _treeValue;
		}
		public function set treeValue(value:String):void
		{
			_treeValue = value;
		}

		private var _isSelected:Boolean;
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		public function fromXML(xml:XML, childFromXMLCallback:Function):void
		{
			this.setComponentSize(xml);
			
			if ("@var" in xml)
			{
				this.treeVar = xml.@["var"];
			}
			
			if ("@value" in xml)
			{
				this.treeValue = xml.@value;
			}	
		}
		
		public function toCode():XML
		{
			var xml:XML = new XML("<" + CodeMxmlUtils.getMXMLTagNameWithSelection(this, PRIME_FACES_XML_ELEMENT_NAME) + "/>");
			var primeFacesNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			var hNamespace:Namespace = new Namespace("h", "http://xmlns.jcp.org/jsf/html");
			xml.addNamespace(primeFacesNamespace);
			xml.setNamespace(primeFacesNamespace);

            CodeXMLUtils.addSizeHtmlStyleToXML(xml, this);
			
			if (treeVar)
			{
				xml.@["var"] = this.treeVar;
			}
			
			if (treeValue)
			{
				xml.@value = this.treeValue;
			}
			
			var node:XML = new XML("<treeNode/>");
			node.addNamespace(primeFacesNamespace);
			node.setNamespace(primeFacesNamespace);
			
			var outputText:XML;
			if (this.treeVar != "")
			{
				outputText = new XML("<outputText/>");
				outputText.addNamespace(hNamespace);
				outputText.setNamespace(hNamespace);
				outputText.@value = "#{"+ this.treeVar +"}";
				node.appendChild(outputText);
			}
			
			xml.appendChild(node);
			
			return xml;
		}
		public function toRoyaleConvertCode():XML
		{	
			return null;

		}
	}
}