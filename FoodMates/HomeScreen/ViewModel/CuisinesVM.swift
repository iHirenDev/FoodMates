//
//  CuisinesVM.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation

struct CuisinesVM {
    
    static func cuisines() -> [Cuisines]{
         let pizza = Cuisines(cuisineName: "Pizza", cuisineImage: "pizza")
         let cafe = Cuisines(cuisineName: "Cafe", cuisineImage: "cafe")
         let burger = Cuisines(cuisineName: "Burger", cuisineImage: "burger")
         let dessert = Cuisines(cuisineName: "Dessert", cuisineImage: "cake-pop")
         let indian = Cuisines(cuisineName: "Indian", cuisineImage: "samosa")
         let steak = Cuisines(cuisineName: "Steak", cuisineImage: "meat")
         let seafood = Cuisines(cuisineName: "SeaFood", cuisineImage: "shrimp")
         let all = Cuisines(cuisineName: "See All", cuisineImage: "cutlery")
        
         return[pizza,cafe,burger,dessert,indian,steak,seafood,all]
    }
}
