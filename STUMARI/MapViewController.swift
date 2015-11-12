//
//  MapViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 11/3/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!

    var annotation = MKPointAnnotation()
    var manager = CLLocationManager()

    // Initial point setup to Tbilisi, Georgia
    var latitude: CLLocationDegrees = 41.6940531
    var longitude: CLLocationDegrees = 44.8006797
    var latDelta: CLLocationDegrees = 0.01
    var longDelta: CLLocationDegrees = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        annotation.coordinate = location
        annotation.title = "This is the center of the search area"
        annotation.subtitle = "To change search area pls long tap or Find me"
        mapView.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(uilpgr)
        println("mapVC viewDidLoaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var newLocation: CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        annotation.coordinate = newLocation
        self.latitude = newLocation.latitude
        self.longitude = newLocation.longitude
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("location has been just updated")
        var userLocation: CLLocation = locations[0] as! CLLocation
        println(userLocation.coordinate.latitude)
        
        self.latitude = userLocation.coordinate.latitude
        self.longitude = userLocation.coordinate.longitude
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        manager.stopUpdatingLocation()
        
        annotation.coordinate = location
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }

    @IBAction func findMeTabbed(sender: AnyObject) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    @IBAction func filterButtonPressed(sender: AnyObject) {
        let requestTableViewController: RequestTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RequestTableViewController") as! RequestTableViewController
        
        requestTableViewController.latitude = latitude
        requestTableViewController.longitude = longitude
        
        self.navigationController?.pushViewController(requestTableViewController, animated: true)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showRequestTVC") {
            let nav = segue.destinationViewController as! UINavigationController
            let requestTableViewController: RequestTableViewController = nav.topViewController as! RequestTableViewController
            requestTableViewController.latitude = latitude
            requestTableViewController.longitude = longitude
            
            println("The showRequestTVC segue has just been performed")
        }
    }
    */
}
