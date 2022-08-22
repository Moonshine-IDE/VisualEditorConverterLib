package utils
{
	import interfaces.IComponent;
	import interfaces.IRoyaleComponentConverter;
	import interfaces.components.IDiv;
	import interfaces.dominoComponents.IBody;
	import interfaces.dominoComponents.IDominoBody;

	public class MainTagCodeUtils  
	{
		public static function getParentContent(title:String, element:IComponent):XML
		{
			var xml:XML = new XML("<html/>");

            var htmlNamespace:Namespace = new Namespace("", "http://www.w3.org/1999/xhtml");
            xml.addNamespace(htmlNamespace);
            xml.setNamespace(htmlNamespace);

			var hNamespace:Namespace = new Namespace("h", "http://xmlns.jcp.org/jsf/html");
			xml.addNamespace(hNamespace);
			
			var uiNamespace:Namespace = new Namespace("ui", "http://xmlns.jcp.org/jsf/facelets");
			xml.addNamespace(uiNamespace);

			var fNamespace:Namespace = new Namespace("f", "http://xmlns.jcp.org/jsf/core");
			xml.addNamespace(fNamespace);

			var pNamespace:Namespace = new Namespace("p", "http://primefaces.org/ui");
			xml.addNamespace(pNamespace);

			var headXml:XML = new XML("<head/>");
			headXml.addNamespace(hNamespace);
			headXml.setNamespace(hNamespace);

			var cssStyleSheetXml:XML = new XML("<link></link>");
            cssStyleSheetXml.@rel = "stylesheet";
			cssStyleSheetXml.@type = "text/css";
            cssStyleSheetXml.@href = "resources/moonshine-layout-styles.css";

            headXml.appendChild(cssStyleSheetXml);

            cssStyleSheetXml = new XML("<link></link>");
            cssStyleSheetXml.@rel = "stylesheet";
            cssStyleSheetXml.@type = "text/css";
            cssStyleSheetXml.@href = "/assets/moonshine-layout-styles.css";

			headXml.appendChild(cssStyleSheetXml);

			if (!title)
			{
				title = "";
			}		
			
			var titleXML:XML = new XML("<title>" + title + "</title>");
			headXml.appendChild(titleXML);
			
			var bodyXML:XML = new XML("<body/>");
			bodyXML.addNamespace(hNamespace);
			bodyXML.setNamespace(hNamespace);

			var mainDiv:XML = new XML("<div/>");

			if (element is IDiv)
			{
				mainDiv["@class"] = (element as IDiv).cssClass;
			}

            CodeXMLUtils.addSizeHtmlStyleToXML(mainDiv, element);
			
			bodyXML.appendChild(mainDiv);
			
			xml.appendChild(headXml);
			xml.appendChild(bodyXML);

			return xml;
		}

		public static function getRoyaleViewParentContent(element:IComponent, componentData:Object):XML
		{
			if (element is IDominoBody)
			{
				var bodyXML:XML = (element as IRoyaleComponentConverter).toRoyaleConvertCode();

				var cdataStart:String = "<![CDATA[\n";
				var alertImport:String = "	import org.apache.royale.jewel.Alert;\n";
				var isDisabled:String = "	[Bindable] private var isDisabled:Boolean = false;\n";
				var selectedRowIndex:String = "	[Bindable] private var selectedRowIndex:int = -1;\n";
				var removeItem:String = "";

				cdataStart += alertImport;

				if (componentData)
				{
					if (componentData.prop)
					{
						var p:Object = componentData.prop[0];

						removeItem = "\tprivate function removeItem():void\n" +
								"\t{\n" +
								"\t\tvar alert:Alert = Alert.show('Are you sure you want to remove this item?',  'Remove', Alert.OK | Alert.CANCEL);\t\t\t\n" +
								"\t\t\talert.addEventListener('close', function closeAlert(e:Event):void { if (e['detail'] == Alert.OK) \n" +
								"    \t\t\t\t\t\t\t\t\t{\n" +
								"    \t\t\t\t\t\t\t\t\t\t" + p.propName + "Items.splice(selectedRowIndex, 1); \n" +
								"    \t\t\t\t\t\t\t\t\t\tdg.refreshCurrentDataProvider();\n" +
								"    \t\t\t\t\t\t\t\t\t}});\n" +
								"\t}";

						var items:String = "	[Bindable] private var ";
						cdataStart += "	import vo." + p.propType + ";\n";
						cdataStart += "	[Bindable] private var " + p.propName + ":" + p.propType;
						items += p.propName + "Items:Array = [];\n";
						if (p.newInstance)
						{
							cdataStart += " = new " + p.propType + "()" + ";\n";
						}
						else
						{
							cdataStart += ";\n";
						}

						cdataStart += items;
					}
				}

				cdataStart += isDisabled;
				cdataStart += selectedRowIndex;
				cdataStart += "\n" + removeItem;

				var cdataEnd:String = "\n]]>";

				cdataStart += cdataEnd;

				var mxmlNamespace:Namespace = new Namespace("fx", "http://ns.adobe.com/mxml/2009");
				var scriptXML:XML = new XML("<Script/>");
					scriptXML.setNamespace(mxmlNamespace);

				var cdata:XML = new XML(cdataStart);
					scriptXML.appendChild(cdata);

				bodyXML.appendChild(scriptXML);

				return bodyXML;
			}

			return new XML("");
		}

		public static function getDominoParentContent(title:String, element:IBody):XML
		{
			var xml:XML = new XML("<form/>");

            var dxlNamespace:Namespace = new Namespace("", "http://www.lotus.com/dxl");
            xml.addNamespace(dxlNamespace);
            xml.setNamespace(dxlNamespace);

			var bodyXML:XML = new XML("<body/>");
	
			xml.appendChild(bodyXML);

			return xml;
		}
		
		public static function getMainContainerTag(xml:XML):XML
		{
            var body:XMLList = xml.children();
            for each (var item:XML in body)
            {
                var itemName:String = item.name();
                if (itemName.lastIndexOf("body") > -1)
                {
                    return item.children()[0];
                }
            }

			return null;
		}
	}
}