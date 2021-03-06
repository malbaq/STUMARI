//
//  RequestTableViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 9/29/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class RequestTableViewController: UITableViewController {
    // Set up initial price according initial value of the slider
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var numberOfBedsLabel: UILabel!
    
    @IBOutlet var numberOfRoomsLabel: UILabel!
    
    @IBOutlet var radiusLabel: UILabel!
    
    var latitude: CLLocationDegrees = 41.6940531
    var longitude: CLLocationDegrees = 44.8006797
    var geoPoint: PFGeoPoint!
    
    var radius: Double = 3.0
    
    var price: Int = 50
    
    var bed: Int = 2
    
    var room: Int = 1
    
    var request: Request?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        geoPoint = PFGeoPoint(latitude: latitude, longitude: longitude)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /* commented by MA
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "showRentals") {
            
            let nav = segue.destinationViewController as! UINavigationController
            let tableOfRentalsViewController: TableOfRentalsViewController = nav.topViewController as! TableOfRentalsViewController
            // look how to set up the request property and init all the table
            tableOfRentalsViewController.request = self.request
            println("segue \(self.request)")
            
        }
        
    }
    */
    
    @IBAction func searchButtonPressed(sender: AnyObject) {
        
        request = Request(price: price, bed: bed, room: room, radius: radius, geoPoint: geoPoint)
        print("searchbuton \(request)")
        do {
            try request!.save()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            abort()
        }

        
        //then peform segue to table of rentals
        // self.performSegueWithIdentifier("showRentals", sender: self)
        
        let tableOfRentalsViewController: TableOfRentalsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TableOfRentalsViewController") as! TableOfRentalsViewController
        
        tableOfRentalsViewController.request = request
        
        self.navigationController?.pushViewController(tableOfRentalsViewController, animated: true)
    }
    
    @IBAction func priceSliderChanged(sender: UISlider) {
        price = lroundf(sender.value)
        priceLabel.text = "$\(price) max"
    }
    
    @IBAction func numberOfBedsSliderChanged(sender: UISlider) {
        bed = lroundf(sender.value)
        numberOfBedsLabel.text = "\(bed)+ beds"
    }
    
    @IBAction func numberOfRoomsSliderChanged(sender: UISlider) {
        room = lroundf(sender.value)
        numberOfRoomsLabel.text = "\(room)+ rooms"
    }
    
    @IBAction func radiusSliderChanged(sender: UISlider) {
        radius = Double(lroundf(sender.value))
        radiusLabel.text = "Radius: \(Int(radius)) km"
    }
}
