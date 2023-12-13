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
    import utils.StringHelperUtils;
    
	public class DominoGlobalsObjects implements IDominoGlobalsObjects, IRoyaleComponentConverter
	{
		public static const ELEMENT_NAME:String = "dominoGlobals";
        private var _initialize:String;
        private var _terminate:String;
        private var _options:String;
        private var _declarations:String;
        private static const OPTOIN_HEADER="'++LotusScript Development Environment:2:5:(Options):0:74"
        private static const FORWARD_HEADER="'++LotusScript Development Environment:2:5:(Forward):0:1"
        private static const DECLARATIONS_HEADER="'++LotusScript Development Environment:2:5:(Declarations):0:10"
        private static const INITIALIZE_HEADER="'++LotusScript Development Environment:2:2:Initialize:1:10"
        private static const TERMINATE_HEADER="'++LotusScript Development Environment:2:2:Terminate:1:10"
        
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
        public function fromXMLDominoObject(xml:XML):void
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
            var goobalsXml:XML = new XML("<item/>");
            goobalsXml.@name="$Script"
            goobalsXml.@summary="false"
            goobalsXml.@sign="true"

            
            var text:String="";
            
            if (this.options)
			{
				text=OPTOIN_HEADER+"\n";
                text=text+StringHelperUtils.fixXmlSpecailCharacter(this.options)+"\n";
            }
            if (this.terminate)
			{
				text=text+TERMINATE_HEADER+"\n";
                if(this.terminate.indexOf("Sub Terminate")<0){
                    text=text+"Sub Terminate"+"\n";
                } 
                text=text+"' "+StringHelperUtils.fixXmlSpecailCharacter(this.terminate)+"\n";
                if(this.terminate.indexOf("End Sub")<0){
                    text=text+"End Sub"+"\n";
                }
                
            }
            if (this.declarations)
			{
				text=text+DECLARATIONS_HEADER+"\n";
                text=text+"' "+StringHelperUtils.fixXmlSpecailCharacter(this.declarations)+"\n";
            }

            if (this.initialize)
			{
				text=text+INITIALIZE_HEADER+"\n";
                if(this.initialize.indexOf("Sub Initialize")<0){
                    text=text+"Sub Initialize"+"\n";
                } 
                text=text+"' "+StringHelperUtils.fixXmlSpecailCharacter(this.initialize)+"\n";
                if(this.initialize.indexOf("End Sub")<0){
                    text=text+"End Sub"+"\n";
                }
               
            }

            var breakXML:XML=new XML("<break/>");
			var textXml:XML = new XML("<text>"+text+"</text>");
            textXml.appendChild(breakXML);
            goobalsXml.appendChild(textXml);

            return goobalsXml

        }
        public function toRoyaleConvertCode():XML
		{
            return null;
        } 
    }
}