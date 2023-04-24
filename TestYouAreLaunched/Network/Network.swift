//
//  Network.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import Foundation

final public class Network {
            
    func loadVendors() async throws -> [Vendor] {
        return try await withCheckedThrowingContinuation({ continuation in
            guard let urlFile = Bundle.main.url(forResource: "vendors", withExtension: "json") else {
                continuation.resume(throwing: NetworkError.invalidFile)
                return
            }
            
            do {
                let data = try Data(contentsOf: urlFile)
                let response = try JSONDecoder().decode(VendorResponse.self, from: data)
                continuation.resume(returning: response.vendors ?? [])
            } catch let error {
                continuation.resume(throwing: error)
            }
        })
    }
}

// MARK: - Network Enums
extension Network {
    
    enum NetworkError: Error {
        case invalidFile
        
        var description: String {
            switch self {
            case .invalidFile:
                return "Invalid filename/path."
            }
        }
    }
}
