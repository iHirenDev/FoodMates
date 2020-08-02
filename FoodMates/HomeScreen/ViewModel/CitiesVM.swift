//
//  CitiesVM.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation

struct CitiesVM {
    
    static func cities() -> [Cities]{
         let sydney = Cities(cityName: "Sydney", cityImage: "sydney", cityId: 260, cityEntityType: "city")
        let melbourne = Cities(cityName: "Melbourne", cityImage: "melbourne", cityId: 259, cityEntityType: "city")
        let newyork = Cities(cityName: "Newyork", cityImage: "newyork", cityId: 280, cityEntityType: "city")
        let istanbul = Cities(cityName: "Istanbul", cityImage: "istanbul", cityId: 59, cityEntityType: "city")
        let london = Cities(cityName: "London", cityImage: "london", cityId: 61, cityEntityType: "city")
        let mumbai = Cities(cityName: "Mumbai", cityImage: "mumbai", cityId: 3, cityEntityType: "city")
        let ahmedabad = Cities(cityName: "Ahmedabad", cityImage: "ahmedabad", cityId: 11, cityEntityType: "city")
        let delhi = Cities(cityName: "Delhi", cityImage: "delhi", cityId: 1, cityEntityType: "city")
        let sanfrancisco = Cities(cityName: "San Francisco", cityImage: "sanfrancisco", cityId: 360, cityEntityType: "city")
        
         return[sydney,melbourne,ahmedabad,newyork,istanbul,london,mumbai,delhi, sanfrancisco]
    }
}
