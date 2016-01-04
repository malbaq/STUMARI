//
//  RentalImagesViewController.swift
//  STUMARI
//
//  Created by Tom Malary on 10/30/15.
//  Copyright (c) 2015 YOUTIR LLC. All rights reserved.
//

import UIKit

class RentalImagesViewController: UIViewController, UIPageViewControllerDataSource {
    
    var arrayOfImages: [PFFile]!

    var pageViewController: UIPageViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageVC") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        var initialContenViewController = self.pageTutorialAtIndex(0) as RentalImagesContentViewController
        
        var viewControllers = NSArray(object: initialContenViewController)
        
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController] as [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        // set the frame or add autolayout constraints http://stackoverflow.com/questions/26605392/does-uipageviewcontroller-has-to-be-full-screen
        // self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageTutorialAtIndex(index: Int) -> RentalImagesContentViewController {
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RentalImagesContentViewController") as! RentalImagesContentViewController
        
        pageContentViewController.imageFile = arrayOfImages[index]
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! RentalImagesContentViewController
        var index = viewController.pageIndex as Int
        
        if(index == 0 || index == NSNotFound) {
            return nil
        }
        
        index--
        
        return self.pageTutorialAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! RentalImagesContentViewController
        var index = viewController.pageIndex as Int
        
        if((index == NSNotFound)) {
            return nil
        }
        
        index++
        
        if(index == arrayOfImages.count) {
            return nil
        }
        
        return self.pageTutorialAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return arrayOfImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
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
