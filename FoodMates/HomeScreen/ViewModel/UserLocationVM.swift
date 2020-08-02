//
//  UserLocationVM.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation
import Combine

class UserLocationVM: ObservableObject{
    @Published var userLocality:String = ""
    
    private let zomatoAPI = ZomatoAPI()
    private var currentLocationCancelable: AnyCancellable?
    
    /*init(lat: Double, lon: Double) {
        currentLocationCancelable = webService.fetchUserLocationInfo(lat: lat, lon: lon)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure:
              self.userLocality = ""
            case .finished:
              break
            }
                }, receiveValue: { [weak self] locationInfo in
                guard let self = self else { return }
                    print(locationInfo.location.title)
                    self.userLocality = locationInfo.location.title
            })
        }*/
    
    
    func fetchUserLocationInfo(lat:Double, lon:Double) {
        currentLocationCancelable = zomatoAPI.fetchUserLocationInfo(lat: lat, lon: lon)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.userLocality = ""
        case .finished:
          break
        }
            }, receiveValue: { [weak self] locationInfo in
            guard let self = self else { return }
                print(locationInfo.location.title)
                self.userLocality = locationInfo.location.title
        })
    }
}
