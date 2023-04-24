//
//  NetworkTests.swift
//  TestYouAreLaunchedTests
//
//  Created by Alex on 23.04.2023.
//

import XCTest
@testable import TestYouAreLaunched

final class NetworkTests: XCTestCase {
    
    private let network = Network()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadJSON() async throws {
        do {
            let vendors = try await network.loadVendors()
            XCTAssertFalse(vendors.isEmpty)
        } catch let error {
            XCTAssertFalse(false, error.localizedDescription)
        }
    }
}
