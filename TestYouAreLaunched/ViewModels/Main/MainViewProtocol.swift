//
//  MainViewProtocol.swift
//  TestYouAreLaunched
//
//  Created by Alex on 25.04.2023.
//

import Foundation

protocol MainViewProtocol {
    func loadVendors() throws
    
    var filteredVendors: [Vendor] { get }
}
