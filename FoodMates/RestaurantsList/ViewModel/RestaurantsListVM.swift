//
//  RestaurantsListVM.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation
import Combine


class RestaurantsListVM: ObservableObject {
    
    @Published var dataSource:[Restaurant] = []
    
    private var zomatoAPI = ZomatoAPI()
    private var restaurantsCancelable: AnyCancellable?

     
    init(entityID:Int, entityType:String) {
        restaurantsCancelable = zomatoAPI.fetchRestaurantsList(enityId: entityID, entityType: entityType)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.dataSource = []
        case .finished:
          break
        }
            }, receiveValue: { [weak self] restaurants in
            guard let self = self else { return }
                
                self.dataSource = (restaurants.restaurants?.map({$0.restaurant}))! as! [Restaurant]
            })
    }
    
    
    init(q:String, lat:Double, lon: Double) {
        restaurantsCancelable = zomatoAPI.fetchRestaurantsForLocation(q:q, lat:lat, lon:lon)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.dataSource = []
        case .finished:
          break
        }
            }, receiveValue: { [weak self] restaurants in
            guard let self = self else { return }
                
                self.dataSource = (restaurants.restaurants?.map({$0.restaurant}))! as! [Restaurant]
            })
    }
}
