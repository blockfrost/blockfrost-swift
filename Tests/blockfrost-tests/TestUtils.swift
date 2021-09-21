//
// Created by Dusan Klinec on 21.09.2021.
//

import Foundation
open class TestUtils {
     public class func getEnvProjectId() -> String? {
          ProcessInfo.processInfo.environment["BF_PROJECT_ID"]
     }
}
