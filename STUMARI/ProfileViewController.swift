//
//  ProfileViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 11/8/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var userUsernameLabel: UILabel!
    @IBOutlet var userEmailLabel: UILabel!
    @IBOutlet var haveRentedOrNotStatusLabel: UILabel!
    @IBOutlet var briefDscrptnTitleLabel: UILabel!
    @IBOutlet var briefDscrptnValueLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var phoneValueLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var addressValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func dismissButtonPressed(sender: AnyObject) {
        
    }
}
