//
// Created by Dusan Klinec on 21.09.2021.
//

import Foundation
import BlockfrostSwiftSDK
import Nimble

open class TestUtils {
     public class func getEnvProjectId() -> String? {
          ProcessInfo.processInfo.environment["BF_PROJECT_ID"]
     }

     public class func getEnvProjectIdMainnet() -> String? {
          ProcessInfo.processInfo.environment["BF_MAINNET_PROJECT_ID"]
     }

     public class func getEnvProjectIdTestnet() -> String? {
          ProcessInfo.processInfo.environment["BF_TESTNET_PROJECT_ID"]
     }

     public class func getEnvIpfsProjectId() -> String? {
          ProcessInfo.processInfo.environment["BF_IPFS_PROJECT_ID"]
     }

     public class func initConfig(ipfs: Bool = false) -> BlockfrostConfig? {
          let config = BlockfrostConfig()
          config.basePath = ipfs ? TestConsts.IPFS_URL : TestConsts.TEST_URL
          guard let projectId = (
                  ipfs ? getEnvIpfsProjectId() :
                         getEnvProjectId() ?? (TestConsts.IS_TESTNET ? getEnvProjectIdTestnet(): getEnvProjectIdMainnet())) else {
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
