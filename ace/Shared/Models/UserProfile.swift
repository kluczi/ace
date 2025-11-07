//
//  UserProfile.swift
//  ace
//
//  Created by Bartek on 07/11/2025.
//

import Foundation

struct UserProfile: Codable, Identifiable, Equatable {
    let id: String
    let createdAt: Date
    let updatedAt: Date?

    var displayName: String
    var handedness: String?
    var country: String?
    var city: String?
    var rating: Double?
    var avatarFileName: String?

    enum Handedness: String, Codable {
        case left, right, both
    }

    // coding keys for different JSON format
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case displayName, handedness, country, rating, avatarFileName, city
    }

}
