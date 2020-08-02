//
//  RestaurantDetails.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    let restaurantName: String
    let restautantURL: String
    
    var body: some View {
        WebView(url: restautantURL).navigationBarTitle(restaurantName)
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsView(restaurantName: "Burger Point", restautantURL: "")
    }
}
