//
//  RestaurantsModel.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation

struct RestaurantsModel: Codable {
    let resultsFound, resultsStart, resultsShown: Int
    let restaurants:[Restaurants]?
    
    enum CodingKeys: String, CodingKey {
        case resultsFound = "results_found"
        case resultsStart = "results_start"
        case resultsShown = "results_shown"
        case restaurants
    }
}

struct Restaurants:Codable {
    let restaurant: Restaurant?
}

//MARK: - Restaurant
struct Restaurant:Codable, Identifiable {
    let id, name: String
    let url: String
    let thumb:String
    let featured_image:String
    let cuisines: String
    let timings: String
    let user_rating:UserRating
    let location:RestaurantLocationInfo
}


// MARK: - UserRating
struct UserRating: Codable {
    let aggregateRating: AggregateRating
    let ratingText, ratingColor: String
    //let ratingObj: RatingObj
    let votes: AggregateRating

    enum CodingKeys: String, CodingKey {
        case aggregateRating = "aggregate_rating"
        case ratingText = "rating_text"
        case ratingColor = "rating_color"
        case votes
    }
    
    
}

enum AggregateRating: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AggregateRating.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AggregateRating"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
    
    var stringValue: String? {
        switch self {
        case .string(let s):
            return s
        default:
            return nil
        }
    }
    
    var intValue: Int? {
        switch self {
        case .integer(let i):
            return i
        default:
            return nil
        }
    }
}

// MARK: - Location
struct RestaurantLocationInfo: Codable {
    let address, locality, city: String
    let cityID: Int
    let latitude, longitude, zipcode: String
    let countryID: Int
    let localityVerbose: String

    enum CodingKeys: String, CodingKey {
        case address, locality, city
        case cityID = "city_id"
        case latitude, longitude, zipcode
        case countryID = "country_id"
        case localityVerbose = "locality_verbose"
    }
}
