//
//  RentalImagesContentViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 10/31/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class RentalImagesContentViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    var imageFile: PFFile!
    var pageIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let logoImageFile = self.imageFile
        logoImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                        self.imageView.image = UIImage(data:imageData)
                }
            }
        }
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
