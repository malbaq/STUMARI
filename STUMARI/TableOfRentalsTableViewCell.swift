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
    @IBOutlet var image4cell: PFImageView!
    
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
        self.image4cell.image = UIImage(named: "placeholder")
        
        let logoImageFile = rental.image[1]
        logoImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        self.image4cell.image = UIImage(data:imageData)
                }
            }
        }
    }
}