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

package components.domino
{
    import interfaces.dominoComponents.IDominoFormObjects
    import interfaces.IRoyaleComponentConverter;
	import interfaces.ILookup;

	import interfaces.ISurface;
	public class DominoFormObjects implements IDominoFormObjects, IRoyaleComponentConverter
	{
		public static const ELEMENT_NAME:String = "code";

		public function DominoFormObjects()
		{
			
		}

		private var _webQueryOpen:String;
        private var _webQuerySave:String;
        private var _queryOpen:String;
        private var _postOpen:String;
        private var _queryModeChange:String;
        private var _postModeChange:String;
        private var _queryRecalc:String;
        private var _postRecalc:String;
        private var _querySave:String;
        private var _postSave:String;
        private var _querySend:String;
        private var _postSend:String;
        private var _queryClose:String;
        private var _initialize:String;
        private var _terminate:String;

        public function get webQueryOpen():String {
            return _webQueryOpen;
        }

        public function set webQueryOpen(value:String):void {
            _webQueryOpen = value;
        }

        public function get webQuerySave():String {
            return _webQuerySave;
        }

        public function set webQuerySave(value:String):void {
            _webQuerySave = value;
        }

        public function get queryOpen():String {
            return _queryOpen;
        }

        public function set queryOpen(value:String):void {
            _queryOpen = value;
        }

        public function get postOpen():String {
            return _postOpen;
        }

        public function set postOpen(value:String):void {
            _postOpen = value;
        }

        public function get queryModeChange():String {
            return _queryModeChange;
        }

        public function set queryModeChange(value:String):void {
            _queryModeChange = value;
        }

        public function get postModeChange():String {
            return _postModeChange;
        }

        public function set postModeChange(value:String):void {
            _postModeChange = value;
        }

        public function get queryRecalc():String {
            return _queryRecalc;
        }

        public function set queryRecalc(value:String):void {
            _queryRecalc = value;
        }

        public function get postRecalc():String {
            return _postRecalc;
        }

        public function set postRecalc(value:String):void {
            _postRecalc = value;
        }

        public function get querySave():String {
            return _querySave;
        }

        public function set querySave(value:String):void {
            _querySave = value;
        }

        public function get postSave():String {
            return _postSave;
        }

        public function set postSave(value:String):void {
            _postSave = value;
        }

        public function get querySend():String {
            return _querySend;
        }

        public function set querySend(value:String):void {
            _querySend = value;
        }

        public function get postSend():String {
            return _postSend;
        }

        public function set postSend(value:String):void {
            _postSend = value;
        }

        public function get queryClose():String {
            return _queryClose;
        }

        public function set queryClose(value:String):void {
            _queryClose = value;
        }

        public function get initialize():String {
            return _initialize;
        }

        public function set initialize(value:String):void {
            _initialize = value;
        }

        public function get terminate():String {
            return _terminate;
        }

        public function set terminate(value:String):void {
            _terminate = value;
        }

        public function toCode():XML
		{
            return null;
        }
        public function fromXML(xml:XML,childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
        }

        public function toRoyaleConvertCode():XML
		{
            var xml:XML=new XML("<code/>")
            return xml
        }
		
	}
}