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
