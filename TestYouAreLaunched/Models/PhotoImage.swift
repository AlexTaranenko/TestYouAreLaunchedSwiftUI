//
//  Image.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import Foundation

// MARK: - PhotoImage
public struct PhotoImage: Codable {
    
    let id: Int?
    let mediaUrl: String?
    let mediaType: MediaType?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case mediaUrl = "media_url"
        case mediaType = "media_type"
    }
    
    init(id: Int?, mediaUrl: String?, mediaType: MediaType?) {
        self.id = id
        self.mediaUrl = mediaUrl
        self.mediaType = mediaType
    }
}

// MARK: - PhotoImage Enums
extension PhotoImage {
    
    public enum MediaType: String, Codable {
        case image
    }
}
