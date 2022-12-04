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
     * The %color.names; 
     * entity lists the color names that can be used for values of the %color; 
     * entity.
     * <!ENTITY % color.names " aqua | black | blue | fuchsia | gray | green |
     *  lime | maroon | navy | olive | purple | red | silver | teal | white | 
     * yellow | none | system " >
     */
    public class ColorName
	{
        public static const AQUA:ColorName          = new ColorName(AQUA);
        public static const BLACK:ColorName         = new ColorName(BLACK);
        public static const FUCHSIA:ColorName       = new ColorName(FUCHSIA);
        public static const GRAY:ColorName          = new ColorName(GRAY);
        public static const GREEN:ColorName         = new ColorName(GREEN);
        public static const LIME:ColorName          = new ColorName(LIME);
        public static const MAROON:ColorName        = new ColorName(MAROON);
        public static const NAVY:ColorName          = new ColorName(NAVY);
        public static const OLIVE:ColorName         = new ColorName(OLIVE);
        public static const PURPLE:ColorName        = new ColorName(PURPLE);
        public static const RED:ColorName           = new ColorName(RED);
        public static const SILVER:ColorName           = new ColorName(SILVER);
        public static const TEAL:ColorName           = new ColorName(TEAL);
        public static const WHITE:ColorName           = new ColorName(WHITE);
        public static const YELLOW:ColorName           = new ColorName(YELLOW);
        public static const NONE:ColorName           = new ColorName(NONE);
        public static const SYSTEM:ColorName           = new ColorName(SYSTEM);
        /* Constructor */
		public function ColorName(d:ColorName)
		{
        }


        public function toString():String
        {
            switch(this) {
                case ColorName.AQUA:
                    return "aqua";
                case ColorName.BLACK:
                    return "black";
                case ColorName.FUCHSIA:
                    return "fuchsia";
                case ColorName.GRAY:
                    return "gray";
                case ColorName.GREEN:
                    return "green";
                case ColorName.LIME:
                    return "lime";
                case ColorName.MAROON:
                    return "maroon";
                case ColorName.NAVY:
                    return "navy";
                case ColorName.OLIVE:
                    return "olive";
                case ColorName.PURPLE:
                    return "purple";
                case ColorName.RED:
                    return "red";
                case ColorName.SILVER:
                    return "silver";
                case ColorName.TEAL:
                    return "teal";
                case ColorName.WHITE:
                    return "white";
                case ColorName.YELLOW:
                    return "yellow";
                case ColorName.NONE:
                    return "none";  
                case ColorName.SYSTEM:
                    return "system";    
                default:
                    /* ColorName.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }
    }
}