//
//  TableOfRentalsViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 10/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class TableOfRentalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var request: Request!
    
    var arrayOfRentals: [Rental] = [Rental](){
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("fuck viewDidLoad \(request)")
        self.setUpRentals()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRentals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TableOfRentalsTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableOfRentalsTableViewCell
        
        let rental = arrayOfRentals[indexPath.row]
        
        cell.setRental(rental)
        
        //        if indexPath.row % 2 == 0 {
        //            quoteCell.backgroundColor = UIColor.blueColor()
        //        } else {
        //            quoteCell.backgroundColor = UIColor.redColor()
        //        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rental = arrayOfRentals[indexPath.row]
        var detailsOfRentalTableViewController: DetailsOfRentalTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailsOfRentalTableViewController") as! DetailsOfRentalTableViewController
        
        detailsOfRentalTableViewController.rental = rental
        self.navigationController?.pushViewController(detailsOfRentalTableViewController, animated: true)
        //        self.presentViewController(detailViewController, animated: true, completion: nil)
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func setUpRentals() {
        
        var query = Rental.query()
        
        println(query)
        
        query!.whereKey("price", lessThanOrEqualTo: request.price)
        
        query!.whereKey("bed", greaterThanOrEqualTo: request.bed)
        
        query!.whereKey("room", greaterThanOrEqualTo: request.room)
        
        query!.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects as? [Rental] {
                    self.arrayOfRentals = objects
                } else {
                    // need to code what to show if nothing to match the request
                }
                println("the first rental is \(self.arrayOfRentals[0])")
            }
        }
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
