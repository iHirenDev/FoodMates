//
//  ZomatoAPI.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation
import Combine


class ZomatoAPI{
    
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
      self.session = session
    }
    

    private let apiKey = "3802ea4cdf4a38c01faf4a116cc08ee6"
    private let baseURL = "https://developers.zomato.com/api/v2.1/"
    private let headers = ["Accept":"application/json", "user-key":"3802ea4cdf4a38c01faf4a116cc08ee6"]
    

    
    
    func fetchUserLocationInfo(lat: Double, lon: Double) -> AnyPublisher<UserLocation, Error> {
        
        let locationURL = baseURL + "geocode"
        var components = URLComponents(string: locationURL)
        components?.queryItems = [URLQueryItem(name: "lat", value: "\(lat)"),
        URLQueryItem(name: "lon", value: "\(lon)")]

        
        
        var request = URLRequest(url: (components?.url)!)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        return session.dataTaskPublisher(for: request)
                .map{$0.data}
                .mapError{ error -> Error in
                    switch error{
                    case URLError.cannotFindHost:
                        return ZomatoError.network(description: error.localizedDescription)
                    default:
                        return ZomatoError.parsing(description: error.localizedDescription)
                    }
                    
                }
                .receive(on: RunLoop.main)
                .decode(type: UserLocation.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
    }
    
    
    func locationSearch(city:String) -> AnyPublisher<LocationSearchModel,Error>{
        
        let locationURL = baseURL + "locations"
        var components = URLComponents(string: locationURL)
        components?.queryItems = [URLQueryItem(name: "query", value: city),
        URLQueryItem(name: "count", value: "10")]

        
        
        var request = URLRequest(url: (components?.url)!)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        return session.dataTaskPublisher(for: request)
            .map{$0.data}
            .mapError{ error -> Error in
                switch error{
                case URLError.cannotFindHost:
                    return ZomatoError.network(description: error.localizedDescription)
                default:
                    return ZomatoError.parsing(description: error.localizedDescription)
                }
                
            }
            .receive(on: RunLoop.main)
            .decode(type: LocationSearchModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    func fetchRestaurantsList(enityId:Int, entityType:String) -> AnyPublisher<RestaurantsModel, Error> {
        let searchURL = baseURL + "search"
        var components = URLComponents(string: searchURL)
        components?.queryItems = [URLQueryItem(name: "entity_id", value: "\(enityId)"), URLQueryItem(name: "entity_type", value: entityType),URLQueryItem(name: "count", value: "50")]
        
        var request = URLRequest(url: (components?.url)!)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map{$0.data}
            .mapError{ error -> Error in
                switch error{
                case URLError.cannotFindHost:
                    return ZomatoError.network(description: error.localizedDescription)
                default:
                    return ZomatoError.parsing(description: error.localizedDescription)
                }
                
            }
            .receive(on: RunLoop.main)
            .decode(type: RestaurantsModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchRestaurantsForLocation(q: String, lat: Double, lon: Double) -> AnyPublisher<RestaurantsModel, Error> {
        
        let searchURL = baseURL + "search"
        var components = URLComponents(string: searchURL)
        components?.queryItems = [URLQueryItem(name: "q", value: "\(q)"), URLQueryItem(name: "count", value: "50"), URLQueryItem(name: "lat", value: "\(lat)"), URLQueryItem(name: "lon", value: "\(lon)"), URLQueryItem(name: "sort", value: "real_distance")]
        
        var request = URLRequest(url: (components?.url)!)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(apiKey, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        
        return URLSession.shared.dataTaskPublisher(for: request)
        .map{$0.data}
        .mapError{ error -> Error in
            switch error{
            case URLError.cannotFindHost:
                return ZomatoError.network(description: error.localizedDescription)
            default:
                return ZomatoError.parsing(description: error.localizedDescription)
            }
            
        }
        .receive(on: RunLoop.main)
        .decode(type: RestaurantsModel.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
