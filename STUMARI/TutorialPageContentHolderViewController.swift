//
//  TutorialPageContentHolderViewController.swift
//  MyNewUIPageViewControllerExample
//
//  Created by Sergey Kargopolov on 2015-05-09.
//  Copyright (c) 2015 Sergey Kargopolov. All rights reserved.
//

import UIKit

class TutorialPageContentHolderViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    var imageFileName: String!
    var pageIndex:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myImageView.image = UIImage(named:imageFileName)
        
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
