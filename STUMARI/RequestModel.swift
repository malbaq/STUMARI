//
//  RequestModel.swift
//  STUMARI
//
//  Created by Tom Malary on 9/30/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import Foundation

class Request : PFObject, PFSubclassing {
    
    @NSManaged var price: Int
    @NSManaged var bed: Int
    @NSManaged var room: Int
    @NSManaged var radius: Int
    @NSManaged var geoPoint: PFGeoPoint

    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Request"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(price: Int, bed: Int, room: Int, radius: Int, geoPoint: PFGeoPoint) {
        self.init()
        self.price = price
        self.bed = bed
        self.room = room
        self.radius = radius
        self.geoPoint = geoPoint
    }
}