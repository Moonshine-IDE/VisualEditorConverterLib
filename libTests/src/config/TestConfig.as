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
package config
{
    public class TestConfig
    {
        private static var _instance:TestConfig;

        /**
         * Provide direct path to src folder of tests
         */
        public var baseURL:String = "";

        public function TestConfig(testConfigEnforcer:TestConfigEnforcer)
        {
            if (testConfigEnforcer == null)
            {
                throw  new Error("Call getInstant()!");
            }
        }

        public static function getInstance():TestConfig
        {
            if (_instance == null)
            {
                _instance = new TestConfig(new TestConfigEnforcer());
            }

            return _instance;
        }
    }
}

class TestConfigEnforcer{}
