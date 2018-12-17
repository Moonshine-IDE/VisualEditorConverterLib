package utils
{
	import interfaces.IComponentSizeOutput;
	import interfaces.IComponentPercentSizeOutput;
	import interfaces.IComponent;

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

		public static function setSizeFromXMLToComponent(xml:XML, component:IComponent):void
        {
            var componentSizeOutput:IComponentSizeOutput = component as IComponentSizeOutput;

            if ("@width" in xml)
            {
                component["percentWidth"] = Number.NaN;
                component["percentWidth"] = xml.@width;

                if (componentSizeOutput && isNaN(component["width"]))
                {
                    (component as IComponentSizeOutput).widthOutput = false;
                }
                else if (componentSizeOutput)
                {
                    (component as IComponentSizeOutput).widthOutput = true;
                }
            }
            else if ("@percentWidth" in xml)
            {
                component["width"] = Number.NaN;
                component["percentWidth"] = xml.@percentWidth;
            }
            else if (componentSizeOutput)
            {
                (component as IComponentSizeOutput).widthOutput = false;
                component["width"] = Number.NaN;
            }

            if ("@height" in xml)
            {
                component["percentHeight"] = Number.NaN;
                component["height"] = xml.@height;

                if (componentSizeOutput && isNaN(component["height"]))
                {
                    (component as IComponentSizeOutput).heightOutput = false;
                }
                else if (componentSizeOutput)
                {
                    (component as IComponentSizeOutput).heightOutput = true;
                }
            }
            else if ("@percentHeight" in xml)
            {
                component["height"] = Number.NaN;
                component["percentHeight"] = xml.@percentHeight;
            }
            else if (componentSizeOutput)
            {
                (component as IComponentSizeOutput).heightOutput = false;
                component["height"] = Number.NaN;
            }
        }
	}
}