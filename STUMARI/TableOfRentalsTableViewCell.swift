//
//  TableOfRentalsTableViewCell.swift
//  STUMARI
//
//  Created by Tom Malary on 10/11/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class TableOfRentalsTableViewCell: UITableViewCell {
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var bedLabel: UILabel!
    @IBOutlet var roomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRental(rental: Rental){
        rental.fetchIfNeeded()
        self.priceLabel.text = String(rental.price)
        self.bedLabel.text = String(rental.bed)
        self.roomLabel.text = String(rental.room)
        //        self.transitRate.text = String(quote.transitRate)
        //        self.transitTime.text = String(quote.transitTime)
        //        self.logoImage.image = UIImage(named: "placeholder")
        //        self.logoImage.layer.cornerRadius = CGRectGetWidth(self.logoImage.frame)/15.0
        //        self.logoImage.layer.masksToBounds = true
        
        
        //        let logoImageFile = quote.carrier["logoImage"] as! PFFile
        //        logoImageFile.getDataInBackgroundWithBlock {
        //            (imageData: NSData?, error: NSError?) -> Void in
        //            if error == nil {
        //                if let imageData = imageData {
        //                    self.logoImage.image = UIImage(data:imageData)
        //                }
        //            }
        //        }
    }
}
