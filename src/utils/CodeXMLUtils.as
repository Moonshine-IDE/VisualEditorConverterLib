////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) STARTcloud, Inc. 2015-2022. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the Server Side Public License, version 1,
//  as published by MongoDB, Inc.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  Server Side Public License for more details.
//
//  You should have received a copy of the Server Side Public License
//  along with this program. If not, see
//
//  http://www.mongodb.com/licensing/server-side-public-license
//
//  As a special exception, the copyright holders give permission to link the
//  code of portions of this program with the OpenSSL library under certain
//  conditions as described in each individual source file and distribute
//  linked combinations including the program with the OpenSSL library. You
//  must comply with the Server Side Public License in all respects for
//  all of the code used other than as permitted herein. If you modify file(s)
//  with this exception, you may extend this exception to your version of the
//  file(s), but you are not obligated to do so. If you do not wish to do so,
//  delete this exception statement from your version. If you delete this
//  exception statement from all source files in the program, then also delete
//  it in the license file.
//
////////////////////////////////////////////////////////////////////////////////
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