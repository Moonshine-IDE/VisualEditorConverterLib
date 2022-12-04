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
package components.enum
{
    /**
     * https://www.ibm.com/support/knowledgecenter/SSVRGU_9.0.1/basic/H_DEFINED_ENTITIES_XML.html
     * This class is a enum class for domino dxl cell background repeat type list.
     * he %cellbackground.repeats; entity defines the style options for displaying the background image of a cell or view. 
     * This entity is used in the <cellbackground> and <viewbackground> elements.
     * once | vrepeat | hrepeat | tile | center | resize
     */
    public class CellBackgroundRepeat
	{
        /**Displays the image once, without repeating it. */
        public static const ONCE:CellBackgroundRepeat	        = new CellBackgroundRepeat(ONCE);
        /**Repeats the image vertically. */
        public static const VREPEAT:CellBackgroundRepeat	    = new CellBackgroundRepeat(VREPEAT);
		/**Repeats the image horizontally. */
        public static const HREPEAT:CellBackgroundRepeat	    = new CellBackgroundRepeat(HREPEAT);
		/**Tiles the image, filling the background with multiple copies of it. */
        public static const TILE:CellBackgroundRepeat	        = new CellBackgroundRepeat(TILE);
		/**Centers the image. */
        public static const CENTER:CellBackgroundRepeat     	= new CellBackgroundRepeat(CENTER);
        /**Allows resizing of the image. */
        public static const RESIZE:CellBackgroundRepeat	        = new CellBackgroundRepeat(RESIZE);

 
		/* Constructor */
		public function CellBackgroundRepeat(d:CellBackgroundRepeat)
		{
			/*
			 * Empty fake constructor
			 * The part that matter is that it accepts a 'copy' of itself
			 * For the recursive assignment to work
			 */
		}


        public function toString():String
        {
            switch(this) {
                case CellBackgroundRepeat.ONCE:
                    return "once";
                case CellBackgroundRepeat.VREPEAT:
                    return "vrepeat";
                case CellBackgroundRepeat.HREPEAT:
                    return "hrepeat";
                case CellBackgroundRepeat.TILE:
                    return "tile";
                case CellBackgroundRepeat.CENTER:
                    return "center";
                case CellBackgroundRepeat.RESIZE:
                    return "resize";
                default:
                    /* CellBackgroundRepeat.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }

    }    

}