//
//  OrderModel.swift
//  STUMARI
//
//  Created by Tom Malary on 11/10/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Order : PFObject, PFSubclassing {
    
    @NSManaged var rental: Rental
    @NSManaged var firstDate: NSDate
    @NSManaged var lastDate: NSDate
    @NSManaged var guest: PFUser
    @NSManaged var payment: Float
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Order"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(rental: Rental, firstDate: NSDate, lastDate: NSDate, guest: PFUser, payment: Float) {
        self.init()
        self.rental = rental
        self.firstDate = firstDate
        self.lastDate = lastDate
        self.payment = payment
    }
}