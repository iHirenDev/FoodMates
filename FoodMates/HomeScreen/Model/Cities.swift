//
//  Cities.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation

struct Cities: Identifiable{
    var id: String = UUID().uuidString
    let cityName: String
    let cityImage: String
    let cityId: Int
    let cityEntityType: String
    
    init(cityName: String, cityImage: String, cityId: Int, cityEntityType: String) {
        self.cityName = cityName
        self.cityImage = cityImage
        self.cityId = cityId
        self.cityEntityType = cityEntityType
    }
}
