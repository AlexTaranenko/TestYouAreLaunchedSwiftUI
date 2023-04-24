//
//  Vendor.swift
//  TestYouAreLaunched
//
//  Created by Alex on 23.04.2023.
//

import Foundation

// MARK: - VendorResponse
public struct VendorResponse: Codable {
    
    let vendors: [Vendor]?
}

// MARK: - Vendor
public struct Vendor: Codable {
    
    let id: Int?
    let companyName: String?
    let areaServed: String?
    let shopType: ShopType?
    let favorited: Bool?
    let follow: Bool?
    let businessType: BusinessType?
    let coverPhoto: PhotoImage?
    let categories: [Category]?
    let tags: [Tag]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case companyName = "company_name"
        case areaServed = "area_served"
        case shopType = "shop_type"
        case favorited
        case follow
        case businessType = "business_type"
        case coverPhoto = "cover_photo"
        case categories
        case tags
    }
    
    init(id: Int?, companyName: String?, areaServed: String?, shopType: ShopType?, favorited: Bool?, follow: Bool?, businessType: BusinessType?, coverPhoto: PhotoImage?, categories: [Category]?, tags: [Tag]?) {
        self.id = id
        self.companyName = companyName
        self.areaServed = areaServed
        self.shopType = shopType
        self.favorited = favorited
        self.follow = follow
        self.businessType = businessType
        self.coverPhoto = coverPhoto
        self.categories = categories
        self.tags = tags
    }
}

// MARK: - Vendor Enums
extension Vendor {
    
    public enum ShopType: String, Codable {
        case bikeShop = "Bike Shop"
        case flowers = "Flowers"
        case bar = "Bar"
    }
    
    public enum BusinessType: String, Codable {
        case virtual
        case physical
    }
}
