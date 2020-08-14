//
//  LocationSearchVM.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation
import Combine

class LocationSearchVM: ObservableObject {
    
    @Published var city:String = ""
    @Published var dataSource:[LocationSuggestion] = []
    
    private let zomatoAPI = ZomatoAPI()
    private var disposables = Set<AnyCancellable>()

   
    init(schedular: DispatchQueue = DispatchQueue(label: "LocationViewModel")) {
        $city
        .dropFirst(1)
        .debounce(for: .seconds(0.5), scheduler: schedular)
        .sink(receiveValue: locationSearch(city:))
        .store(in: &disposables)
    }
    
    
    func locationSearch(city:String) {
        zomatoAPI.locationSearch(city: city)
        .receive(on: DispatchQueue.main)
        .sink(
          receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure:
              self.dataSource = []
            case .finished:
              break
            }
          },
          receiveValue: { [weak self] locationInfo in
            guard let self = self else { return }
            
            if(locationInfo.locationSuggestions == nil){
                self.dataSource = []
            }else{
            self.dataSource = locationInfo.locationSuggestions!
            }
        })
        .store(in: &disposables)
    }
}
