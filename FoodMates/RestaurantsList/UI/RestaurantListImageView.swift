//
//  RestaurantListImageView.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI


struct RestaurantListImageView<Placeholder: View>: View {
    
    @ObservedObject private var loader:ImageLoader
    private let placeholder:Placeholder?
    
    init(url:URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
        .onAppear(perform: loader.load)
        .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View{
        Group{
            if loader.image != nil{
                Image(uiImage: loader.image!)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Rectangle())
                .cornerRadius(10.0)
                .padding(.trailing)
            }else{
                placeholder
            }
        }
    }
}



//struct RestaurantListImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantListImageView()
//    }
//}
