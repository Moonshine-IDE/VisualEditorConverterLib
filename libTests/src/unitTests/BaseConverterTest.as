////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package
{
    import converter.Converter;

    import events.ConverterErrorEvent;

    import events.ConverterEvent;

    import org.flexunit.asserts.fail;

    public class BaseConverterTest
    {
        protected var converter:Converter;

        protected var conversionCompletedHandler:Function;
        protected var conversionFailedHandler:Function;
        protected var unknownItemHandler:Function;

        public function setUpTest():void
        {
            converter = Converter.getInstance();
        }

        public function tearDownTest():void
        {
            if (conversionCompletedHandler != null)
            {
                Converter.getInstance().removeEventListener(ConverterEvent.CONVERSION_COMPLETED, conversionCompletedHandler);
            }

            if (unknownItemHandler != null)
            {
                Converter.getInstance().removeEventListener(ConverterEvent.UNKNOWN_CONVERSION_ITEM, unknownItemHandler);
            }

            if (conversionFailedHandler != null)
            {
                Converter.getInstance().removeEventListener(ConverterErrorEvent.CONVERSION_FAILED, conversionFailedHandler);
            }

            conversionCompletedHandler = null;
            unknownItemHandler = null;
            conversionFailedHandler = null;
            converter = null;
        }

        protected function defaultUnknownItemHandler(event:ConverterEvent):void
        {

        }

        protected function defaultConversionFailedHandler(event:ConverterErrorEvent):void
        {
            fail("Conversion failed with error: ".concat(event.errorMessage));
        }

        protected function timeOutAsyncTest(passThroughData:Object):void
        {
            fail(passThroughData.timeOut);
        }
    }
}
