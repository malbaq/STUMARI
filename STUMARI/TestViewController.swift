//
//  TestViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 10/12/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var price = 300
    var bed = 2
    var room = 3
    var jpegNamedArray: [String] = ["exm2.jpg", "exm1.jpg", "exm3.jpg"]
    var pffileImgArray: [PFFile] = [PFFile]()
    var geoPoint = PFGeoPoint(latitude: 41.6940530, longitude: 44.8006790)
    
    func uiimageJpeg2pffile (jpegImageName: [String]) -> [PFFile] {
        for name in jpegImageName {
            let img = UIImage(named: name)
            let data = UIImageJPEGRepresentation(img!, 5.0)
            let returnImg = PFFile(data: data!)
            pffileImgArray.append(returnImg!)
        }
        return pffileImgArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.uiimageJpeg2pffile(jpegNamedArray)
//        var rental = Rental2Save(price: price, bed: bed, room: room, image: pffileImgArray, geoPoint: geoPoint)
//        rental.save()

        // testing gradient extension
        
        let background = CAGradientLayer().maskForCell(false)
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
