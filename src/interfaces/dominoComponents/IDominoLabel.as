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
package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IIsSelected;
    import interfaces.IDominoVisualHideOption;
    /** dxl example of text 
    <par def='6'><run><font color='blue'/>
    Example string...
    </run></par>
        */

    public interface IDominoLabel extends IDominoVisualHideOption,IComponent, IIsSelected
    {
        function get text():String;
        function set text(value:String):void;

        function get size():String;
        function set size(value:String):void;

        function get color():String;
        function set color(value:String):void;

        function get fontStyle():String;
        function set fontStyle(value:String):void;


        function get fontName():String;
        function set fontName(value:String):void;

        function get hidewhen():String
        function set hidewhen(value:String):void;

        function get isNewLine():String
        function set isNewLine(value:String):void;

        function get truetype():String
        function set truetype(value:String):void;

        function get pitch():String
        function set pitch(value:String):void;

        function get familyid():String
        function set familyid(value:String):void;

        //HTML
		function get htmlId():String;
        function set htmlId(value:String):void;
		function get htmlClass():String;
        function set htmlClass(value:String):void;
		function get htmlStyle():String;
        function set htmlStyle(value:String):void;
		function get htmlTitle():String;
        function set htmlTitle(value:String):void;
		function get htmlOther():String;
        function set htmlOther(value:String):void;



    }
}
