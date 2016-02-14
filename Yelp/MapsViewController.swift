//
//  MapsViewController.swift
//  Yelp
//
//  Created by Santos Solorzano on 2/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {
    
    var latitude: String?
    var longitude: String?
    @IBOutlet weak var businessMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let latitude = self.latitude, longitude = self.longitude {
            let centerLocation = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
            let coordinate = CLLocationCoordinate2D(
                latitude: Double(latitude)!,
                longitude: Double(longitude)!
                
            )
            goToLocation(centerLocation, coordinate: coordinate)
        }

        // Do any additional setup after loading the view.
    }
    
    func goToLocation(location: CLLocation, coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpanMake(0.025, 0.025)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "An annotation!"
        businessMap.addAnnotation(annotation)
        businessMap.setRegion(region, animated: false)
    }
    
//    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D) {
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = coordinate
//        annotation.title = "An annotation!"
//        businessMap.addAnnotation(annotation)
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
