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

package loaders
{
    import config.TestConfig;

    import flash.utils.setTimeout;

    import utils.FileRepository;
    import mx.rpc.AsyncToken;
    import mx.rpc.IResponder;
    import mx.rpc.http.HTTPService;
    import mx.utils.LoaderUtil;

    import org.flexunit.runner.external.ExternalDependencyToken;
    import org.flexunit.runner.external.IExternalDependencyLoader;

    import vo.TestCaseVO;

    public class TestConfigurationLoader implements IExternalDependencyLoader, IResponder
    {
        private const TEST_CONTENT_PATH:String = "examples";

        private var httpService:HTTPService;
        private var token:ExternalDependencyToken;
        private var testName:String;
        private var fileName:String;

        private var fileSeparator:String;

        public function TestConfigurationLoader(fileName:String, testName:String)
        {
            this.token = new ExternalDependencyToken();
            this.fileName = fileName;
            this.testName = testName;
            this.fileSeparator = "/";

            createHttpService();
        }

        public function retrieveDependency(testClass:Class):ExternalDependencyToken
        {
            var asyncToken:AsyncToken = httpService.send();
            asyncToken.addResponder(this);

            return token;
        }

        public function result(data:Object):void
        {
            var dp:Array = null;
            if (data && data.result)
            {
                dp = parseTestConfigData(data.result);
            }
            else
            {
                token.notifyFault("Unable to load data tests");
                return;
            }

            setTimeout(token.notifyResult, 50, dp);
        }

        public function fault(info:Object):void
        {
            var message:String = "";
            if (info)
            {
                message = info.toString();
            }

            token.notifyFault("Unable to load data tests ".concat(message));
        }

        private function parseTestConfigData(xmlData:XML):Array
        {
            var testConfigData:Array = [];
            var testCases:XMLList = xmlData.TestCase.(@testName == this.testName);
            for each (var testCase:XML in testCases)
            {
                var testCaseFilePath:String = TestConfig.getInstance().baseURL.concat(TEST_CONTENT_PATH,
                        fileSeparator, this.fileName, fileSeparator, "tests", fileSeparator);
                FileRepository.readFile(testCaseFilePath, testCase.@fileName, null, fault);

                testConfigData.push([new TestCaseVO(testCaseFilePath, testCase.@fileName)]);
            }

            return testConfigData;
        }

        private function createHttpService():void
        {
            var rootUrl:String = TestConfig.getInstance().baseURL.concat("examples", fileSeparator, fileName, fileSeparator);

            httpService = new HTTPService();
            httpService.url = LoaderUtil.createAbsoluteURL(rootUrl, fileName + ".xml");
            httpService.resultFormat = "e4x";
        }
    }
}
