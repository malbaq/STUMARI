//
//  LogInViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 10/13/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

//
//  LoginViewController.swift
//  YOUTIR
//
//  Created by Tom Malary on 5/3/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class LogInViewController: PFLogInViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //        self.view.backgroundColor = UIColor.lightGrayColor()
        
        let logoView = UIImageView(image: UIImage(named:"logo.png"))
        self.logInView!.logo = logoView
        logoView.contentMode = UIViewContentMode.ScaleAspectFit
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