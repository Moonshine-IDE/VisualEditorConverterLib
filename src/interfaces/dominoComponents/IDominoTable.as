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
package interfaces.dominoComponents
{
    import interfaces.IComponent;
    import interfaces.IIsSelected;
    import interfaces.IDominoVisualHideOption;

    /**
     * Domino table dxl element, more details access follow url:
     * https://www.ibm.com/support/knowledgecenter/SSVRGU_9.0.1/basic/H_TABLE_ELEMENT_XML.html
     * Contains an optional <tablerowstyle> element, an optional <border> element, 
     * followed by any number of <tablecolumn> and <tablerow> elements.
     */

    public interface IDominoTable  extends IDominoVisualHideOption,IComponent,IIsSelected
    {  
        
        function get minrowheight():String;
		function set minrowheight(value:String):void;

        function get rowspacing():String;
		function set rowspacing(value:String):void;

        function get columnspacing():String;
		function set columnspacing(value:String):void;

        function get cellborderstyle():String;
		function set cellborderstyle(value:String):void;

        function get colorstyle():String;
		function set colorstyle(value:String):void;

        function get bgcolor():String;
		function set bgcolor(value:String):void;

        function get altbgcolor():String;
		function set altbgcolor(value:String):void;
        
        function get leftmargin():String;
		function set leftmargin(value:String):void;

        function get rightmargin():String;
		function set rightmargin(value:String):void;

        function get r4spacing():String;
		function set r4spacing(value:String):void;

        function get rowdisplay():String;
		function set rowdisplay(value:String):void;

        function get rowtimer():String;
		function set rowtimer(value:String):void;

        function get sizetabsequally():String;
		function set sizetabsequally(value:String):void;

        function get tablocation():String;
		function set tablocation(value:String):void;

        function get outsidewrap():String;
		function set outsidewrap(value:String):void;

        function get insidewrap():String;
		function set insidewrap(value:String):void;

        function get insidewrapheight():String;
		function set insidewrapheight(value:String):void;


        function get widthtype():String;
		function set widthtype(value:String):void;


        function get columnProperties():String
        function set columnProperties(value:String):void;

        /** % html.core.attrs "
         *htmlid,htmlclass,htmlstyle
         *htmltitle,extrahtmlattrs
         */

         /** %
          *  direction.attrs
         */
    }
}
