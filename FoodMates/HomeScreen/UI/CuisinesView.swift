//
//  CuisinesView.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI

struct CuisinesView: View {
    
    let cuisines = CuisinesVM.cuisines()
    
    let lattitude: Double
    let longitude: Double
    let title: String
    
    var body: some View {
        
        VStack {
            Text("Explore cusines around \(title)")
                .bold()
                .font(.system(size: 18))
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(cuisines){cuisine in
                        
                        VStack(spacing:10){
                            
                            NavigationLink(destination: RestaurantsListView(resListVM: RestaurantsListVM(q: cuisine.cuisineName, lat: self.lattitude, lon: self.longitude), city: self.title)){
                            Image(cuisine.cuisineImage)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 80, height: 80)
                            }
                            
                            
                            Text(cuisine.cuisineName)
                                    .bold()
                        }
//                        .overlay(
//                            RoundedRectangle(cornerRadius:10)
//                                .stroke(Color.gray, lineWidth: 4)
//                        )
                    }
                }.padding()
            }
        }
    }
}

struct CuisinesView_Previews: PreviewProvider {
    static var previews: some View {
        CuisinesView(lattitude: -33.500, longitude: 150.435, title: "Pizza")
    }
}
