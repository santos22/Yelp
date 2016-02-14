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
        
        if let latitude = self.latitude {
            print(latitude)
        }
        
        if let longitude = self.longitude {
            print(longitude)
        }
        
        let centerLocation = CLLocation(latitude: Double(latitude!)!, longitude: Double(longitude!)!)
        goToLocation(centerLocation)

        // Do any additional setup after loading the view.
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        businessMap.setRegion(region, animated: false)
    }

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
