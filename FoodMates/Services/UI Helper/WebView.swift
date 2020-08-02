//
//  WebView.swift
//  FoodMates
//
//  Created by Hiren Patel on 25/7/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url = ""
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let web = WKWebView()
        web.load(URLRequest(url: URL(string: url)!))
        return web
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}
