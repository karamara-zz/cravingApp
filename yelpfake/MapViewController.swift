//
//  MapViewController.swift
//  yelpfake
//
//  Created by Paul Kwon on 11/19/15.
//  Copyright © 2015 Paul Kwon. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    let restaurant1 = Restaurant(title: "Pho All Day", locationName: "locationName", foodType: "generic Location", coordinate: CLLocationCoordinate2D(latitude: 47.6118372, longitude: -122.1999748))
    let restaurant2 = Restaurant(title: "Pho Cyclo Café", locationName: "locationName", foodType: "generic Location", coordinate: CLLocationCoordinate2D(latitude: 47.6148948669434, longitude: -122.195762634277))
    func getAllrestaurants(){
            
        }
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        getAllrestaurants()
        if(CLLocationManager.locationServicesEnabled()){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            print("location manager")
        }
        mapView.addAnnotation(restaurant1)
        mapView.addAnnotation(restaurant2)
        mapView.showsUserLocation = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last! as CLLocation
//        myLocation = Artwork(title: "Annotation1", locationName: "locationName", discipline: "generic Location", coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
//        mapView.addAnnotation(myLocation)
        print(location)
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        print(center)
        self.mapView.setRegion(region, animated: true)
    }
    
    // sets the rectangular region to display to get correct zoom level
//    let regionRadius: CLLocationDistance = 1000
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//            regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
