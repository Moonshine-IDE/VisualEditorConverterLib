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
    public interface IDominoFormObjects  extends IComponent
	{ 
        function get webQueryOpen():String;
	    function set webQueryOpen(value:String):void; 

        function get webQuerySave():String;
	    function set webQuerySave(value:String):void; 

        function get queryOpen():String;
	    function set queryOpen(value:String):void; 

        function get postOpen():String;
	    function set postOpen(value:String):void; 

        function get queryModeChange():String;
	    function set queryModeChange(value:String):void; 

        function get postModeChange():String;
	    function set postModeChange(value:String):void; 

        function get queryRecalc():String;
	    function set queryRecalc(value:String):void; 

        function get postRecalc():String;
	    function set postRecalc(value:String):void; 

        function get querySave():String;
	    function set querySave(value:String):void; 

        function get postSave():String;
	    function set postSave(value:String):void; 

        function get querySend():String;
	    function set querySend(value:String):void; 

        function get postSend():String;
	    function set postSend(value:String):void; 

        function get queryClose():String;
	    function set queryClose(value:String):void;
    }
}