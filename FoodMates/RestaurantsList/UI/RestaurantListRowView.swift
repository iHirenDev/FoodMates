//
//  RestaurantListRowView.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI

struct RestaurantListRowView: View {
    
    var restaurant: Restaurant
    @State private var isAnimating = true

    var body: some View {
        HStack{
            RestaurantListImageView(url: URL(string: restaurant.featured_image) ?? URL(string:  "https://image.flaticon.com/icons/png/128/1539/1539660.png")!, placeholder: ActivityIndicator(isAnimating:                                       self.$isAnimating,
                                                                                                                                                                                          style: .large)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.trailing))
          
            
            VStack(alignment: .leading, spacing: 20){
                
                HStack(alignment: .center){
                    Text(restaurant.name)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                    
                    Spacer()
                    Text(" \(restaurant.user_rating.aggregateRating                .stringValue ?? "3.5") ★ ")
                            .foregroundColor(.white)
                            .background(Capsule()
                            .fill(Color.green)
                                .frame(width:55, height: 30), alignment: .center)
                }
                
                HStack{
                Text(restaurant.cuisines)
                    Spacer()
                Image(systemName: "map")
                    .padding()
                }
            }
        }
    }
}


struct RestaurantListRowView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListRowView(restaurant: Restaurant(id: "123", name: "Burger Point", url: "", thumb: "", featured_image: "fast-food", cuisines: "Pizza, Burger", timings: "", user_rating: UserRating(aggregateRating: AggregateRating.string("3.5"), ratingText: "", ratingColor: "", votes: AggregateRating.integer(4))))
    }
}
