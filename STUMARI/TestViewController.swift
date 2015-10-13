//
//  TestViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 10/12/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var price = 2
    var bed = 2
    var room = 3
    var jpegNamedArray: [String] = ["example.jpg", "exm2.jpg"]
    var pffileImgArray: [PFFile] = [PFFile]()
    
    func uiimageJpeg2pffile (jpegImageName: [String]) -> [PFFile] {
        for name in jpegImageName {
            var img = UIImage(named: name)
            var data = UIImageJPEGRepresentation(img, 5.0)
            var returnImg = PFFile(data: data)
            pffileImgArray.append(returnImg)
        }
        return pffileImgArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiimageJpeg2pffile(jpegNamedArray)
        var rental = Rental2Save(price: price, bed: bed, room: room, image: pffileImgArray)
        rental.save()

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