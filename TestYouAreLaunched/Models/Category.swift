//
//  Category.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import Foundation

// MARK: - Category
public struct Category: Codable {
    
    let id: Int?
    let name: String?
    let image: PhotoImage?
    
    init(id: Int?, name: String?, image: PhotoImage?) {
        self.id = id
        self.name = name
        self.image = image
    }
}
