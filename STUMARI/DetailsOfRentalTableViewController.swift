//
//  DetailsOfRentalTableViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 10/13/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit
import MapKit

class DetailsOfRentalTableViewController: UITableViewController, PFLogInViewControllerDelegate, MKMapViewDelegate {
    
    @IBOutlet var mapViewToShowTheLocationOfTheRental: MKMapView!
    @IBOutlet var imageButton: UIButton!
//    @IBOutlet var imageOfRental: PFImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var bedLabel: UILabel!
    @IBOutlet var roomLabel: UILabel!
    @IBOutlet var briefDescriptionLabel: UILabel!
    @IBOutlet var fullDescriptionLabel: UILabel!
    
    var imageDefault = UIImage(named: "placeholder")
    
    var rental: Rental!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        let latitude: CLLocationDegrees = self.rental.geoPoint.latitude
        let longitude: CLLocationDegrees = rental.geoPoint.longitude
        let latDelta: CLLocationDegrees = 0.001
        let longDelta: CLLocationDegrees = 0.001
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapViewToShowTheLocationOfTheRental.setRegion(region, animated: true)
        // to Swift 2 from rental.fetchIfNeeded()
        do {
            try rental.fetchIfNeeded()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            abort()
        }
        self.priceLabel.text = String(rental.price)
        self.bedLabel.text = String(rental.bed)
        self.roomLabel.text = String(rental.room)
        self.briefDescriptionLabel.text = rental.briefDescription
        self.fullDescriptionLabel.text = rental.fullDescription
        self.imageButton.setImage(imageDefault, forState: .Normal)
        
        // to Swift 2 from  rental.fetchIfNeeded()
        do {
            try  rental.fetchIfNeeded()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            //abort()
        }
        
        let logoImageFile = rental.image[0]
        logoImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data: imageData)
                    self.imageButton.setImage(image, forState: .Normal)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Potentially incomplete method implementation.
    //        // Return the number of sections.
    //        return 0
    //    }
    //
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete method implementation.
    //        // Return the number of rows in the section.
    //        return 0
    //    }
    
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    func callForLogin() {
        
        let logInController = LogInViewController()
        logInController.signUpController = SignUpViewController()
        
        logInController.delegate = self
        
        /* logInController.facebookPermissions = ["email", "public_profile"] */
        
        logInController.fields = ([PFLogInFields.UsernameAndPassword, PFLogInFields.LogInButton, PFLogInFields.SignUpButton, PFLogInFields.PasswordForgotten, PFLogInFields.DismissButton]
            /* | PFLogInFields.Facebook */)
        
        self.presentViewController(logInController, animated: true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewControllerDidCancelLogIn(controller: PFLogInViewController) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func imageButtonPressed(sender: AnyObject) {
        let rentalImagesViewController: RentalImagesViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RentalImagesViewController") as! RentalImagesViewController
        
        rentalImagesViewController.arrayOfImages = rental.image
        self.navigationController?.pushViewController(rentalImagesViewController, animated: true)
        //        self.presentViewController(detailViewController, animated: true, completion: nil)
    }
    @IBAction func OrderNowButtonPressed(sender: AnyObject) {
        if PFUser.currentUser() == nil {
            let alert = UIAlertController(title: "Need to be authorized", message: "To place an order you have to authorize first", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                alert.dismissViewControllerAnimated(true, completion: nil)
                self.callForLogin()
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
                alert.dismissViewControllerAnimated(true, completion: nil)
            })
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            self.callForLogin()
            // need to substitude by self.paypalVCCalling()
        }
    }

    
    ///////////////////////////////////
    
    var order: Order?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "makeOrder") {
            
            let nav = segue.destinationViewController as! UINavigationController
            let profileVC: ProfileViewController = nav.topViewController as! ProfileViewController
            // look how to set up the request property and init all the table
            profileVC.order = self.order
            print("segue makeOrder")
        }
    }
    @IBAction func testingOrderCreation (sender: AnyObject) {
        
        let firstDate = NSDate()
        let lastDate = NSDate()
        let guest = PFUser.currentUser()
        order = Order(rental: self.rental, firstDate: firstDate, lastDate: lastDate, guest: guest!, payment: 3.0)
        // to Swift 2 order!.save()
        do {
            try order!.save()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            //abort()
        }
        self.performSegueWithIdentifier("makeOrder", sender: self)
    }
}