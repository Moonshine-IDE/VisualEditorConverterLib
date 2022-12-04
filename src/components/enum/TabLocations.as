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
     * The %table.tablocations; entity defintes the options for the placement
     *  of tabs on a row in a table if the Show only one row at a time option is selected as a table property. 
     */
    public class TabLocations
	{
        /**Displays the row tabs at the beginning of the currently displaying table row. Tabs look like rolodex index tabs. */
        public static const TOP:TabLocations          = new TabLocations(TOP);
        /**Displays the row tabs in a vertical list to the left of the table row.  */
        public static const LEFT:TabLocations         = new TabLocations(LEFT);
        /**Displays the row tabs at the end of the currently displaying table row. Tabs look like rolodex index tabs. */
        public static const BOTTOM:TabLocations       = new TabLocations(BOTTOM);
        /**Displays the row tabs in a vertical list to the right of the table row. */
        public static const RIGHT:TabLocations        = new TabLocations(RIGHT);
         /* Constructor */
		public function TabLocations(d:TabLocations)
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
                case TabLocations.TOP:
                    return "top";
                case TabLocations.LEFT:
                    return "left";
                case TabLocations.BOTTOM:
                    return "bottom";
                case TabLocations.RIGHT:
                    return "right";
                default:
                    /* TabLocations.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }

    }
}    
