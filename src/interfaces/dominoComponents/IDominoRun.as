////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2016-present Prominic.NET, Inc.
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
/** 
 * Represents a few lines of selected or highlighted text. 
 * To apply a formatting style to a large block of text, use the <block> element. 
 * run dxl details please review follow url: 
 * https://www.ibm.com/support/knowledgecenter/SSVRGU_10.0.1/basic/H_RUN_ELEMENT_XML.html
 * Contained by: %richtext.nonhot.inline;
 * Contains: &lt;font&gt;, %richtext.inline;
 */
package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IDominoVisualHideOption;

    public interface IDominoRun  extends IComponent,IDominoVisualHideOption
    {  
        //If true, the block of text is in passthru HTML format. 
        function get html():Boolean;
        function set html(value:Boolean):void;

        //Highlight color option, as defined in the %highlights; entity.
        function get highlight():String;
        function set highlight(value:String):void;

    }
}

