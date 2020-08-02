//
//  CitiesView.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI

struct CitiesView: View {
    
    let cities = CitiesVM.cities()
    
    var body: some View {
        
        VStack {
            Text("Explore famous food around the world")
                .bold()
                .font(.system(size: 18))
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(cities){city in
                        
                        VStack(spacing:10){
                            
                            NavigationLink(destination: RestaurantsListView(resListVM: RestaurantsListVM(entityID: city.cityId, entityType: city.cityEntityType), city: city.cityName)){
                            Image(city.cityImage)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                               .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 5))
                            }
                            
                            Text(city.cityName)
                                    .bold()
                            }
                    }
                }.padding()
            }
        }
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
