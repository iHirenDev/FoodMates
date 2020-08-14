//
//  MapView.swift
//  FoodMates
//
//  Created by Hiren Patel on 4/8/20.
//  Copyright © 2020 com.hiren. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @Binding var annotations:[RestaurantAnnotations]
    
    func makeUIView(context:Context)->MKMapView{
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    
    func updateUIView(_ view:MKMapView, context:Context){
        view.showAnnotations(annotations, animated: true)
        view.addAnnotations(annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}


class Coordinator: NSObject, MKMapViewDelegate {
    var parent:MapView
    
    init(_ parent:MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Restaurant")
        annotationView.canShowCallout = true
        annotationView.image = UIImage(named: "mappin")
        annotationView.displayPriority = .required
        return annotationView
    }
}


