//
//  IntroViewController.swift
//  Carousel Demo
//
//  Created by Samuel Shih on 2/2/15.
//  Copyright (c) 2015 Samuel Shih. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var introView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    // Tile Views
    @IBOutlet weak var tileOne: UIImageView!
    @IBOutlet weak var tileTwo: UIImageView!
    @IBOutlet weak var tileThree: UIImageView!
    @IBOutlet weak var tileFour: UIImageView!
    @IBOutlet weak var tileFive: UIImageView!
    @IBOutlet weak var tileSix: UIImageView!
    
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    // Order of the transforms: Translate, Rotate, Scale
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CGSize(width: 320, height: 1200)
        scrollView.contentSize = CGSize(width: 320, height: 1200)
        scrollView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        var offset = Float(scrollView.contentOffset.y)
        
        // Content Offset: 0->568
        // x offset: -30 -> 0
        // y offset: -285 -> 0
        
        // X Ys
        var tileOnetx = convertValue(offset, 0, 568, -30, 0)
        var tileOnety = convertValue(offset, 0, 568, -285, 0)
        
        var tileTwotx = convertValue(offset, 0, 568, 75, 0)
        var tileTwoty = convertValue(offset, 0, 568, -240, 0)
        
        var tileThreetx = convertValue(offset, 0, 568, -66, 0)
        var tileThreety = convertValue(offset, 0, 568, -415, 0)
        
        var tileFourtx = convertValue(offset, 0, 568, 10, 0)
        var tileFourty = convertValue(offset, 0, 568, -400, 0)
        
        var tileFivetx = convertValue(offset, 0, 568, -200, 0)
        var tileFivety = convertValue(offset, 0, 568, -480, 0)
        
        var tileSixtx = convertValue(offset, 0, 568, -15, 0)
        var tileSixty = convertValue(offset, 0, 568, -500, 0)
        
        // Scales
        var tileOnescale = convertValue(offset, 0, 568, 1, 1)
        var tileTwoscale = convertValue(offset, 0, 568, 1.65, 1)
        var tileThreescale = convertValue(offset, 0, 568, 1.7, 1)
        var tileFourscale = convertValue(offset, 0, 568, 1.6, 1)
        var tileFivescale = convertValue(offset, 0, 568, 1.65, 1)
        var tileSixscale = convertValue(offset, 0, 568, 1.65, 1)
        
        // Rotations
        var tileOnerotation = convertValue(offset, 0, 568, -10, 0)
        var tileTworotation = convertValue(offset, 0, 568, -10, 0)
        var tileThreerotation = convertValue(offset, 0, 568, 10, 0)
        var tileFourrotation = convertValue(offset, 0, 568, 10, 0)
        var tileFiverotation = convertValue(offset, 0, 568, -10, 0)
        var tileSixrotation = convertValue(offset, 0, 568, -10, 0)
        
        // Tile Transforms
        tileOne.transform = CGAffineTransformMakeTranslation(CGFloat(tileOnetx), CGFloat(tileOnety))
        tileOne.transform = CGAffineTransformRotate(tileOne.transform, CGFloat(Double(tileOnerotation) * M_PI / 180))
        tileOne.transform = CGAffineTransformScale(tileOne.transform , CGFloat(tileOnescale), CGFloat(tileOnescale))
        
        tileTwo.transform = CGAffineTransformMakeTranslation(CGFloat(tileTwotx), CGFloat(tileTwoty))
        tileTwo.transform = CGAffineTransformRotate(tileTwo.transform, CGFloat(Double(tileTworotation) * M_PI / 180))
        tileTwo.transform = CGAffineTransformScale(tileTwo.transform , CGFloat(tileTwoscale), CGFloat(tileTwoscale))
        
        tileThree.transform = CGAffineTransformMakeTranslation(CGFloat(tileThreetx), CGFloat(tileThreety))
        tileThree.transform = CGAffineTransformRotate(tileThree.transform, CGFloat(Double(tileThreerotation) * M_PI / 180))
        tileThree.transform = CGAffineTransformScale(tileThree.transform , CGFloat(tileThreescale), CGFloat(tileThreescale))
        
        tileFour.transform = CGAffineTransformMakeTranslation(CGFloat(tileFourtx), CGFloat(tileFourty))
        tileFour.transform = CGAffineTransformRotate(tileFour.transform, CGFloat(Double(tileFourrotation) * M_PI / 180))
        tileFour.transform = CGAffineTransformScale(tileFour.transform , CGFloat(tileFourscale), CGFloat(tileFourscale))
        
        tileFive.transform = CGAffineTransformMakeTranslation(CGFloat(tileFivetx), CGFloat(tileFivety))
        tileFive.transform = CGAffineTransformRotate(tileFive.transform, CGFloat(Double(tileFiverotation) * M_PI / 180))
        tileFive.transform = CGAffineTransformScale(tileFive.transform , CGFloat(tileFivescale), CGFloat(tileFivescale))
        
        tileSix.transform = CGAffineTransformMakeTranslation(CGFloat(tileSixtx), CGFloat(tileSixty))
        tileSix.transform = CGAffineTransformRotate(tileSix.transform, CGFloat(Double(tileSixrotation) * M_PI / 180))
        tileSix.transform = CGAffineTransformScale(tileSix.transform , CGFloat(tileSixscale), CGFloat(tileSixscale))
        
        println("content offset: \(offset)")
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
