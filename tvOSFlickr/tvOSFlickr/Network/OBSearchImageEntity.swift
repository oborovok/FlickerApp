//
//  OBSearchImageEntity.swift
//  tvOSFlickr
//
//  Created by Oleksandr Borovok on 12/18/17.
//  Copyright © 2017 Oleksandr Borovok. All rights reserved.
//

import UIKit

// MARK: - Search Image Entity
enum OBSearchImageEntityStatType: String, Codable {
    case ok
    case error
}

struct OBSearchImageEntity: Codable {
    
    enum OBSearchImageEntityCodingKeys: String, Codable {
        case photos
        case stat
    }
    
    let photos: OBPhotosEntity
    let stat: OBSearchImageEntityStatType
    
}

// MARK: - Photos Entity
struct OBPhotosEntity: Codable {
    
    enum OBPhotosEntityCodingKeys: String, Codable {
        case page
        case pages
        case perpage
        case photo
        case total
    }
    
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [OBPhotoEntity]
    let total: String
    
}

// MARK: - Photo Entity
struct OBPhotoEntity: Codable {
    
    enum OBPhotoEntityCodingKeys: String, Codable {
        case farm
        case photoId = "id"
        case isFamily = "isfamily"
        case isFriend = "isfriend"
        case isPublic = "ispublic"
        case owner
        case secret
        case server
        case title
    }
    
    let farm: Int
    let id: String
    let isfamily: Int
    let isfriend: Int
    let ispublic: Int
    let owner: String
    let secret: String
    let server: String
    let title: String
    
}
