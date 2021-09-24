import Foundation
import BlockfrostSwiftSDK

public final class Example {
    let exampleAddr = "addr1q8zu4smzyf2r2mfqjd6tc6vxf2p8rccdfk82ye3eut2udkw9etpkygj5x4kjpym5h35cvj5zw83s6nvw5fnrnck4cmvshkfm4y"
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func run() throws {
        let group = DispatchGroup()
        group.enter()
        
        // Default config, resolved to mainnet, project id from env var BF_MAINNET_PROJECT_ID
        // Using global response queue as main will be blocked, waiting for a result
        BlockfrostStaticConfig.apiResponseQueue = .global()
        if BlockfrostStaticConfig.projectId == nil {
            fatalError("Please, set project id in BF_MAINNET_PROJECT_ID env var")
        }

        print("Querying address: \(exampleAddr)")
        let api = CardanoAddressesAPI()
        _ = api.getAddressDetails(address: exampleAddr) { resp in
            switch (resp) {
            case let .failure(err):
                print("Error getting an address: \(self.exampleAddr): \(err)")
                break
            case let .success(r):
                print("Address data: \(r), \(r.address), \(r.txCount), \(r.sentSum)")
                print("JSON-encoded: \(String(data: (try? CodableHelper.encode(r).get()) ?? Data(), encoding: .utf8) ?? "-")")
                break
            }
            group.leave()
        }

        // Wait for async to complete
        group.wait()

        // Explicit configuration
        let config = BlockfrostConfig.mainnetDefault().clone()
        config.projectId = "non-existent"  // your project id here
        config.apiResponseQueue = .global()
        group.enter()

        print("\n\nQuery 2: invalid project ID")
        let api2 = CardanoAddressesAPI(config: config)
        _ = api2.getAddressDetails(address: exampleAddr) { resp in
            switch (resp) {
            case let .failure(err):
                print("Error getting an address: \(err)")
                break
            case let .success(r):
                print("Address data: \(r)")
                break
            }
            group.leave()
        }

        // Wait for async to complete
        group.wait()
        print("run() finished")
    }
}


let tool = Example()
do {
    try tool.run()
} catch {
    print("An error occurred: \(error)")
}
