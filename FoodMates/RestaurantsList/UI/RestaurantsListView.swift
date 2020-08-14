//
//  RestaurantsListView.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI
import MapKit

struct RestaurantsListView: View {
    
    @ObservedObject var resListVM: RestaurantsListVM
    @State private var isAnimating = true
    @State var locationInfo = [RestaurantAnnotations]()
    @State var isShowingMap = false
    @State var index = 0
    
    let city: String
    
    var body: some View {
        VStack {
            if(self.index == 0){
                if(self.resListVM.dataSource.isEmpty){
                    CustomActivityIndicator(loadingText: "Loading...")
                }else{
                    List(self.resListVM.dataSource, id: \.name){restaurant in
                        NavigationLink(destination: RestaurantDetailsView(restaurantName:restaurant.name ,restautantURL:restaurant.url)){
                            RestaurantListRowView(restaurant:restaurant)
                        }
                    }
                }
            }else{
                MapView(annotations: $locationInfo)
            }
            
        }.onAppear{
            for i in self.resListVM.dataSource{
                let lat = Double(i.location.latitude)
                let lon = Double(i.location.longitude)
                self.locationInfo.append(RestaurantAnnotations(title: i.name, coordinate: CLLocationCoordinate2D(latitude: lat ?? -33.5152, longitude: lon ?? 151.8765)))
            }
            
        }
        .navigationBarTitle(self.city)
        .navigationBarItems(trailing:

            HStack{
                Button(action: {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                       self.index = 0
                    }
                }) {
                    Image(systemName:"list.bullet")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .frame(width:40,height:30)
                }.background(self.index == 0 ? Color.white : Color.clear)
                .clipShape(Rectangle())
                
                Button(action: {
                   withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                      self.index = 1
                   }
                }) {
                    Image(systemName:"map")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .frame(width:40,height:30)
                }.background(self.index == 1 ? Color.white : Color.clear)
                .clipShape(Rectangle())
            }.background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            
            
            // Show map using action sheet...
            /*
             Button(action: {
             self.isShowingMap.toggle()
             }) {
             Image(systemName: "map")
             .foregroundColor(.white)
             }.sheet(isPresented: $isShowingMap) {
             MapView(annotations: self.$locationInfo)
             }*/
        )
    }
}

struct RestaurantsListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsListView(resListVM: RestaurantsListVM(entityID: 123, entityType: "city"), city: "Sydney")
    }
}
