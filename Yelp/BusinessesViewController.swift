//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import CoreLocation

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, CLLocationManagerDelegate {

    var businesses: [Business]!
    var filteredBusinessData: [Business]!
    var navigationSearchBar = UISearchBar()
    var locationManager: CLLocationManager! = CLLocationManager()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSearchBar.sizeToFit()
        navigationItem.titleView = navigationSearchBar
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120 // scroll height
        
        navigationSearchBar.delegate = self
        filteredBusinessData = businesses

    }
    
    override func viewDidAppear(animated: Bool) {
        let alert = UIAlertController(title: "What are you in the mood for?", message: "Enter a food (i.e. thai, chicken, etc.)", preferredStyle: .Alert)
        
        // add the text field
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        
        // grab the value from the text field, and use it as a search query
        alert.addAction(UIAlertAction(title: "Let's go!", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            Business.searchWithTerm(textField.text!, completion: { (businesses: [Business]!, error: NSError!) -> Void in
                self.businesses = businesses
                self.filteredBusinessData = businesses
                self.tableView.reloadData()
            })
        }))
        
        // present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func location() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        
//        let location = locationManager.location
//        
//        let currentLocation = locationManager.location
//        let long = "\(currentLocation?.coordinate.longitude)"
//        let lat = "\(currentLocation?.coordinate.latitude)"
//        print("CS: \(currentLocation?.coordinate.longitude) , \(currentLocation?.coordinate.latitude)")
//    }
    
//    func locationManager(manager: CLLocationManager,   didUpdateLocations locations: [CLLocation]) {
//        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]!) {
//        let location = locations[0] as CLLocation
//        
//        print(location)
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredBusinessData != nil {
            return filteredBusinessData!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        
        cell.business = filteredBusinessData[indexPath.row]
        
        return cell
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.navigationSearchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        navigationSearchBar.showsCancelButton = false
        navigationSearchBar.text = ""
        navigationSearchBar.resignFirstResponder()
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        if searchText.isEmpty {
            filteredBusinessData = businesses
        } else {
            // The user has entered text into the search box
            // Use the filter method to iterate over all items in the data array
            // For each item, return true if the item should be included and false if the
            // item should NOT be included
            filteredBusinessData = businesses.filter({(dataItem: Business) -> Bool in
                // If dataItem matches the searchText, return true to include it
                if dataItem.name!.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil {
                    //print("exists")
                    //self.businesses = businesses
                    //self.filteredBusinessData = businesses
                    return true
                } else {
                    return false
                }
            })
        }
        tableView.reloadData()
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
