//
//  Cuisines.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation

struct Cuisines: Identifiable{
    var id: String = UUID().uuidString
    let cuisineName: String
    let cuisineImage: String
    
    init(cuisineName: String, cuisineImage: String) {
        self.cuisineName = cuisineName
        self.cuisineImage = cuisineImage
    }
}
