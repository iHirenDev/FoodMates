//
//  HomeScreen.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: LocationSearchVM
    @ObservedObject var locationViewModel: UserLocationVM
    @ObservedObject var locationManager = LocationManager()
    
    @State var isOpen:Bool = false
        
    init(viewModel: LocationSearchVM, locationViewModel: UserLocationVM) {
        self.viewModel = viewModel
        self.locationViewModel = locationViewModel
    }
    
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                .frame(height: 20)
                
                TextField("Enter a location", text: $viewModel.city)
                .frame(height:50)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.leading,.trailing])
                .cornerRadius(10.0)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.leading,.trailing])
                
                Divider()
                
                VStack(alignment: .center) {
                    if(viewModel.dataSource.isEmpty){
                     CuisinesView(lattitude: Double(self.userLatitude)!, longitude: Double(self.userLongitude)!, title: locationViewModel.userLocality)
                        Divider()
                        CitiesView()
                        
                        
                    }else if(viewModel.city == ""){
                       
                     CuisinesView(lattitude: Double(self.userLatitude)!, longitude: Double(self.userLongitude)!, title: locationViewModel.userLocality)
                        Divider()
                        CitiesView()
                     
                    }else{
                        List{
                            Section(header: ListHeader()){
                                ForEach(self.viewModel.dataSource, id: \.entityID){city in
                                    
                                    NavigationLink(destination: RestaurantsListView(resListVM: RestaurantsListVM(entityID: city.entityID, entityType: city.entityType), city: city.title)) {
                                                                        Text(city.title)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                    .navigationBarTitle("FoodMates", displayMode: .inline)
                }
            }
        }.onAppear{
        self.locationViewModel.fetchUserLocationInfo(lat: Double(self.userLatitude)!, lon: Double(self.userLongitude)!)
        }
    }
    
    
    struct ListHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "map")
            Text("Searched locations...")
            }
        }
    }

}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: LocationSearchVM(), locationViewModel: UserLocationVM())
    }
}
