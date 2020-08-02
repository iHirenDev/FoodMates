//
//  RestaurantsListView.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI

struct RestaurantsListView: View {

  @ObservedObject var resListVM: RestaurantsListVM
  @State private var isAnimating = true

  let city: String
   
  var body: some View {
          VStack {
              
              if(self.resListVM.dataSource.isEmpty){
                  CustomActivityIndicator(loadingText: "Loading...")
              }else{
                  List(self.resListVM.dataSource, id: \.name){restaurant in
                      
                      NavigationLink(destination: RestaurantDetailsView(restaurantName:restaurant.name ,restautantURL:restaurant.url)){
                      RestaurantListRowView(restaurant:restaurant)
                      }
                  }
              }
          }
              .navigationBarTitle(self.city)
  }
}

//struct RestaurantsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantsListView()
//    }
//}
