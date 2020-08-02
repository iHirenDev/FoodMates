//
//  UserLocation.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation

// MARK: - UserLocation
struct UserLocation: Codable {
    let location: Location

    enum CodingKeys: String, CodingKey {
        case location
    }
}

// MARK: - Location
struct Location: Codable {
    let entityType: String
    let entityID: Int
    let title, latitude, longitude: String
    let cityID: Int
    let cityName: String
    let countryID: Int
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case entityType = "entity_type"
        case entityID = "entity_id"
        case title, latitude, longitude
        case cityID = "city_id"
        case cityName = "city_name"
        case countryID = "country_id"
        case countryName = "country_name"
    }
}

