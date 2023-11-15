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
    import mx.utils.Base64Encoder;
    import interfaces.dominoComponents.IDominoGlobalsObjects
    import interfaces.IRoyaleComponentConverter;
    import interfaces.ILookup;

	import interfaces.ISurface;
	public class DominoGlobalsObjects implements IDominoGlobalsObjects, IRoyaleComponentConverter
	{
		public static const ELEMENT_NAME:String = "dominoGlobals";
        private var _initialize:String;
        private var _terminate:String;
        private var _options:String;
        private var _declarations:String;
		public function DominoGlobalsObjects()
		{
			
		}

        public function get declarations():String {
            return _declarations;
        }

        public function set declarations(value:String):void {
            _declarations = value;
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


        public function get options():String {
            return _options;
        }

        public function set options(value:String):void {
            _options = value;
        }

        public function fromXML(xml:XML,childFromXMLCallback:Function, surface:ISurface, lookup:ILookup):void
		{
            if(xml.@options){
                this.options = xml.@options
            }
            if(xml.@terminate){
                this.terminate = xml.@terminate
            }
            if(xml.@initialize){
                this.initialize = xml.@initialize
            }

            if(xml.@declarations){
                this.declarations = xml.@declarations
            }
        }
        public function toCode():XML
		{
            var goobalsXml:XML = new XML("<globals/>");
            if (this.options)
			{
				var optoinsXml:XML=new XML("<code event='options'/>");
                var lsXml1:XML=new XML("<lotusscript>"+this.options+"</lotusscript>");
                optoinsXml.appendChild(lsXml1);
                goobalsXml.appendChild(optoinsXml);
            }
            if (this.terminate)
			{
				var terninateXml:XML=new XML("<code event='terminate'/>");
                var lsXml2:XML=new XML("<lotusscript>"+this.terminate+"</lotusscript>");
                terninateXml.appendChild(lsXml2);
                goobalsXml.appendChild(terninateXml);
            }
            if (this.declarations)
			{
				var declarationsXml:XML=new XML("<code event='declarations'/>");
                var lsXml3:XML=new XML("<lotusscript>"+this.declarations+"</lotusscript>");
                declarationsXml.appendChild(lsXml3);
                goobalsXml.appendChild(declarationsXml);
            }

            if (this.initialize)
			{
				var initializeXml:XML=new XML("<code event='initialize'/>");
                var lsXml:XML=new XML("<lotusscript>"+this.initialize+"</lotusscript>");
                initializeXml.appendChild(lsXml);
                goobalsXml.appendChild(initializeXml);
            }
			


            return goobalsXml

        }
        public function toRoyaleConvertCode():XML
		{
            return null;
        } 
    }
}