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
    @IBOutlet var briefDescriptionLabel: UILabel!
    @IBOutlet var maskForTop: UIImageView!
    @IBOutlet var maskForBottom: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRental(rental: Rental){
        // to Swift 2 from rental.fetchIfNeeded()
        do {
            try rental.fetchIfNeeded()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            abort()
        }
        self.priceLabel.text = "$" + String(rental.price)
        self.bedLabel.text = "Beds: " + String(rental.bed)
        self.roomLabel.text = "Rooms: " + String(rental.room)
        self.briefDescriptionLabel.text = rental.briefDescription
        self.image4cell.image = UIImage(named: "placeholder")
        //add masks for top and bottom
        
        let backgroundOfMaskForTop = CAGradientLayer().maskForCell(false)
        backgroundOfMaskForTop.frame = self.maskForTop.bounds
        self.maskForTop.layer.insertSublayer(backgroundOfMaskForTop, atIndex: 0)

        let backgroundOfMaskForBottom = CAGradientLayer().maskForCell(true)
        backgroundOfMaskForBottom.frame = self.maskForBottom.bounds
        self.maskForBottom.layer.insertSublayer(backgroundOfMaskForBottom, atIndex: 0)
        
        let logoImageFile = rental.image[0]
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