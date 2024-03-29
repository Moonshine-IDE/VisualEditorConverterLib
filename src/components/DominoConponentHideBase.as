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
package components
{
	import interfaces.IDominoVisualHideOption;

	public class DominoConponentHideBase extends ComponentBase implements IDominoVisualHideOption
	{

        private var _hide:String;
        public function get hide():String
        {
           return  _hide;
        }
        public function set hide(value:String):void
        {
            this._hide =value;
        }
        // private var _noteshide:String;
        // public function get noteshide():String
        // {
        //    return  _noteshide;
        // }
        // public function set noteshide(value:String):void
        // {
        //     this._noteshide =value;
        // }

        // private var _browserhide:String;
        // public function get browserhide():String
        // {
        //     return _browserhide;
        // }
        // public function set browserhide(value:String):void
        // {
        //     this._browserhide =value;
        // }

        // private var _mobile:String;
        // public function get mobile():String
        // {
        //     return _mobile;
        // }
        // public function set mobile(value:String):void
        // {
        //     this._mobile =value;
        // }

        // private var _prereadhide:String;
        // public function get prereadhide():String
        // {
        //     return _prereadhide;
        // }
        // public function set prereadhide(value:String):void
        // {
        //     this._prereadhide = value
        // }


        // private var _preedithide:String;
        // public function get preedithide():String
        // {
        //     return _preedithide;
        // }
        // public function set preedithide(value:String):void
        // {
        //     this._preedithide = value
        // }

        // private var _openreadhide:String;
        // public function get openreadhide():String
        // {
        //     return _openreadhide;
        // }
        // public function set openreadhide(value:String):void
        // {
        //     this._openreadhide = value
        // }

        // private var _openedithide:String;
        // public function get openedithide():String
        // {
        //     return _openedithide;
        // }
        // public function set openedithide(value:String):void
        // {
        //     this._openedithide= value;
        // }

        // private var _printhide:String;
        // public function get printhide():String
        // {
        //     return _printhide;
        // }
        // public function set printhide(value:String):void
        // {
        //     this._printhide=value;
        // }


        // private var _copyhide:String;
        // public function get copyhide():String
        // {
        //     return _copyhide;
        // }
        // public function set copyhide(value:String):void
        // {
        //     this._copyhide=value;
        // }

        // private var _embedhide:String;
        // public function get embedhide():String
        // {
        //     return this._embedhide;
        // }
        // public function set embedhide(value:String):void
        // {
        //     this._embedhide=value;
        // }
    }
}