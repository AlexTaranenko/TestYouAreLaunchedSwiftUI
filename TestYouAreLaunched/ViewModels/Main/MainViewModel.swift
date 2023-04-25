//
//  MainViewModel.swift
//  TestYouAreLaunched
//
//  Created by Alex on 25.04.2023.
//

import Foundation

final public class MainViewModel: ObservableObject, MainViewProtocol {
    
    // MARK: - Properties
    @Published private var vendors: [Vendor]
    @Published var searchText: String
    
    // MARK: - Init
    init() {
        self.vendors = []
        self.searchText = ""
    }
    
    // MARK: - MainViewProtocol
    var filteredVendors: [Vendor] {
        guard !searchText.isEmpty && searchText.count >= 3 else {
            return vendors
        }
        return vendors.filter({ ($0.companyName ?? "").localizedCaseInsensitiveContains(searchText) })
    }

    func loadVendors() throws {
        let network = Network()
        Task { @MainActor in
            do {
                vendors = try await network.loadVendors()
            } catch let error {
                throw error
            }
        }
    }
}
