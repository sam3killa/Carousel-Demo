//
//  TutorialScreenViewController.swift
//  Carousel Demo
//
//  Created by Samuel Shih on 2/4/15.
//  Copyright (c) 2015 Samuel Shih. All rights reserved.
//

import UIKit

class TutorialScreenViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var welcome4Image: UIImageView!
    
    @IBOutlet weak var backupButtonImage: UIImageView!
    
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        
        // Hide Images
        backupButtonImage.alpha = 0
        switchButton.alpha = 0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if pageControl.currentPage < 3 {
            
            UIView.animateWithDuration(0.4, animations: {
            self.backupButtonImage.alpha = 0
            self.switchButton.alpha = 0
            self.pageControl.alpha = 1
            })
        }
        
        if pageControl.currentPage == 3 {
            
            UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
                self.backupButtonImage.alpha = 1
                self.switchButton.alpha = 1
                self.pageControl.alpha = 0
            })
        }
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
