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
package components.enum
{
    /**
     * The %table.widthtypes; entity defines the options for the width of a table. 
     * <!ENTITY % table.widthtypes "fixedleft | fixedcenter | fixedright | fitmargins | fitwindow">
     */
  public class TableWidthStyle
  {
    public static const FIXEDLEFT:TableWidthStyle    = new TableWidthStyle(FIXEDLEFT);
    public static const FIXEDRIGHT:TableWidthStyle   = new TableWidthStyle(FIXEDRIGHT);
    public static const FIXEDCENTER:TableWidthStyle  = new TableWidthStyle(FIXEDCENTER);
    public static const FITMARGINS:TableWidthStyle   = new TableWidthStyle(FITMARGINS);
    public static const FITWINDOW:TableWidthStyle    = new TableWidthStyle(FITWINDOW);


     /* Constructor */
		public function TableWidthStyle(d:TableWidthStyle)
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
                case TableWidthStyle.FIXEDLEFT:
                    return "fixedleft";
                case TableWidthStyle.FIXEDRIGHT:
                    return "fixedright";
                case TableWidthStyle.FIXEDCENTER:
                    return "fixedcenter";
                case TableWidthStyle.FITMARGINS:
                    return "fitmargins";
                case TableWidthStyle.FITWINDOW:
                    return "fitwindow";
                default:
                    /* CellBackgroundRepeat.NONE is considered 'undefined' (no direction) */
                    return "undefined";
            }
        }

  }   
}    