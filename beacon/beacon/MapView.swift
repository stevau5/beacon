//
//  MapView.swift
//  beacon
//
//  Created by Steven Zanga on 2020-03-03.
//  Copyright © 2020 Steven Anthony Zanga. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var lm = CLLocationManager()
    var currentLocation = CLLocationCoordinate2D();
    
    func setupManager(){
        self.lm.requestAlwaysAuthorization();
        self.lm.requestWhenInUseAuthorization();
    }
    
    func makeUIView(context: Context) -> MKMapView {
        self.setupManager()
        let mapView = MKMapView(frame: .zero)
        if CLLocationManager.locationServicesEnabled() {
            self.lm.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.lm.startUpdatingLocation()
        }
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if CLLocationManager.locationServicesEnabled() {
            view.showsUserLocation = true
            view.userTrackingMode = .follow
            view.showsCompass = true
            
            let latitude = lm.location!.coordinate.latitude
            let longitude = lm.location!.coordinate.longitude
            let coordinate = CLLocationCoordinate2D(
                latitude: latitude, longitude: longitude)
            print(coordinate)
            let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
