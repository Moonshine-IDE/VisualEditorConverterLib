package utils
{
	import mx.utils.StringUtil;
	
	import interfaces.IComponent;
	import interfaces.IComponentPercentSizeOutput;
	import interfaces.IComponentSizeOutput;

	public class CodeXMLUtils  
	{
		public static function addSizeHtmlStyleToXML(xml:XML, component:IComponent):void
        {
            var componentSizeOutput:IComponentSizeOutput = component as IComponentSizeOutput;
            var componentPercentSize:IComponentPercentSizeOutput = component as IComponentPercentSizeOutput;

            var styleDiv:String = xml.@style;

            if (!isNaN(component["percentWidth"]) || (componentPercentSize && !isNaN(componentPercentSize.widthPercent)))
            {
                var percentWidth:Number = !isNaN(component["percentWidth"]) ? component["percentWidth"] : componentPercentSize.widthPercent;
                if (componentSizeOutput)
                {
                    if (componentSizeOutput.widthOutput)
                    {
                        styleDiv += "width:" + String(percentWidth) + "%;";
                    }
                }
                else
                {
                    styleDiv += "width:" + String(percentWidth) + "%;";
                }
            }
            else if (!isNaN(component["width"]))
            {
                if (componentSizeOutput)
                {
                    if (componentSizeOutput.widthOutput)
                    {
                        styleDiv += "width:" + String(component["width"]) + "px;";
                    }
                }
                else
                {
                    styleDiv += "width:" + String(component["width"]) + "px;";
                }
            }

            if (!isNaN(component["percentHeight"]) || (componentPercentSize && !isNaN(componentPercentSize.heightPercent)))
            {
                var percentHeight:Number = !isNaN(component["percentHeight"]) ? component["percentHeight"] : componentPercentSize.heightPercent;
                if (componentSizeOutput)
                {
                    if (componentSizeOutput.heightOutput)
                    {
                        styleDiv += "height:" + String(percentHeight) + "%;";
                    }
                }
                else
                {
                    styleDiv += "height:" + String(percentHeight) + "%;";
                }
            }
            else if (!isNaN(component["height"]))
            {
                if (componentSizeOutput)
                {
                    if (componentSizeOutput.heightOutput)
                    {
                        styleDiv += "height:" + String(component["height"]) + "px;";
                    }
                }
                else
                {
                    styleDiv += "height:" + String(component["height"]) + "px;";
                }
            }

            if (styleDiv)
            {
                xml.@style += styleDiv;
            }
        }
		
		public static function getCdataXML(component:XML):XML
		{
			var cdataInformation:String;
			var stringHelper:StringHelperUtils = new StringHelperUtils();
			var scripts:XMLList = component.Script;
			var scriptsCount:int = scripts.length();
			if (scriptsCount > 0)
			{
				for (var i:int = 0; i < scriptsCount; i++)
				{
					cdataInformation = String(scripts[i].text());
					if (cdataInformation)
					{
						cdataInformation = StringUtil.trim(cdataInformation);
						if (cdataInformation.length <= 2)
						{
							cdataInformation = stringHelper.trim(cdataInformation, "\n");
							cdataInformation = stringHelper.trim(cdataInformation, "\t");
						}
						if (cdataInformation)
						{
							return scripts[i];
						}
					}
				}
			}
			
			return null;
		}
		
		public static function getCdataInformationFromXML(component:XML):String
		{
			var script:XML = getCdataXML(component);
			
			return script ? String(script) : null;
		}
	}
}