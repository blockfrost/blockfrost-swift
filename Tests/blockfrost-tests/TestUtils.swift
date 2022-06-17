//
// Created by Dusan Klinec on 21.09.2021.
//

import Foundation
import BlockfrostSwiftSDK
import Nimble
import Quick
import XCTest

open class TestUtils {
     public class func initConfig(ipfs: Bool = false) -> BlockfrostConfig? {
          let config = BlockfrostConfig()
          config.basePath = ipfs ? TestConsts.IPFS_URL : TestConsts.TEST_URL
          guard let projectId = (
                  ipfs ? BlockfrostConfig.getEnvIpfsProjectId() :
                          BlockfrostConfig.getEnvProjectId() ?? (TestConsts.IS_TESTNET ? BlockfrostConfig.getEnvProjectIdTestnet(): BlockfrostConfig.getEnvProjectIdMainnet())) else {
               return nil
          }
          config.projectId = projectId

          BlockfrostStaticConfig.basePath = config.basePath
          BlockfrostStaticConfig.projectId = config.projectId

          BlockfrostConfig.DEFAULT_COUNT = 10  // not to stress backend too much with page loaders
          return config
     }

     public class func getResult<T>(resp: Swift.Result<T, Error>) -> T? {
          switch (resp) {
          case let .failure(err):
               fail("Request failed with error: \(err)")
               return nil
          case let .success(r):
               return r
          }
     }
}

extension QuickSpec {
     func runAsyncTest(
             named testName: String = #function,
             in file: StaticString = #file,
             at line: UInt = #line,
             withTimeout timeout: TimeInterval = TestConsts.TIMEOUT,
             test: @escaping () async throws -> Void
     ) {
          var thrownError: Error?
          let errorHandler = {
               thrownError = $0
          }
          let expectation = expectation(description: testName)

          Task {
               do {
                    try await test()
               } catch {
                    errorHandler(error)
               }

               expectation.fulfill()
          }

          waitForExpectations(timeout: timeout)

          if let error = thrownError {
               XCTFail(
                       "Async error thrown: \(error)",
                       file: file,
                       line: line
               )
          }
     }
}