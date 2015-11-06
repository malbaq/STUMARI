//
//  RentalModel.swift
//  STUMARI
//
//  Created by Tom Malary on 10/5/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Rental : PFObject, PFSubclassing {
    
    @NSManaged var price: Int
    @NSManaged var bed: Int
    @NSManaged var room: Int
    @NSManaged var image: [PFFile]
    @NSManaged var geoPoint: PFGeoPoint
    @NSManaged var briefDescription: String
    @NSManaged var fullDescription: String
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Rental"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(price: Int, bed: Int, room: Int, geoPoint: PFGeoPoint, briefDescription: String, fullDescription: String) {
        self.init()
        self.price = price
        self.bed = bed
        self.room = room
        self.geoPoint = geoPoint
        self.briefDescription = briefDescription
        self.fullDescription = fullDescription
    }
}