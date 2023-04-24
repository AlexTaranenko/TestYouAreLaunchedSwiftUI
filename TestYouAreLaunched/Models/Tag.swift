//
//  Tag.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import Foundation

// MARK: - Tag
public struct Tag: Codable {
    
    let id: Int?
    let name: String?
    let purpose: Purpose?
    
    init(id: Int?, name: String?, purpose: Purpose?) {
        self.id = id
        self.name = name
        self.purpose = purpose
    }
}

// MARK: - Tag Enums
extension Tag {
    
    public enum Purpose: String, Codable {
        case shop
    }
}
