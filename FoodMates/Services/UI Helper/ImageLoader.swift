//
//  ImageLoader.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private let url:URL
    
    init(url:URL) {
        self.url = url
    }
    
    private var cancellable:AnyCancellable?
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map{UIImage(data: $0.data)}
            .replaceError(with: UIImage(systemName: "fast-food"))
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
