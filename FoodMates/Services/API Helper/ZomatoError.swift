//
//  ZomatoError.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import Foundation

enum ZomatoError:Error {
    case network(description: String)
    case parsing(description: String)
}
