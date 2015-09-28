//
//  IntroViewController.swift
//  Week2-Carousel
//
//  Created by Sybico, Christopher on 9/23/15.
//  Copyright © 2015 Sybico, Christopher. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    
    @IBOutlet weak var introScrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        introScrollView.delegate = self
        
        introScrollView.contentSize = CGSize(width: 320, height: 1136)
        
        scrollViewDidScroll(introScrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Tim's Convert Value Function
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        
        let scrollViewYOffset = introScrollView.contentOffset.y
        
        
        
        // -- Photo 1
        
        // From -46 to 49. Offset = -95
        let photo1XOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -95, r2Max: 0)
        
        // From 477 - 751 - 20 = -294
        let photo1YOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -284, r2Max: 0)

        // From 0 to 10. Offset = -10
        let photo1Rotation = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        photo1.transform = CGAffineTransformMakeTranslation(photo1XOffset, photo1YOffset)
        photo1.transform = CGAffineTransformRotate(photo1.transform, CGFloat(Double(photo1Rotation) * M_PI / 180))
        
        
        
        // -- Photo 2
        
        // From 199 to 202. Offset = -3 + (76/2) = 35
        let photo2XOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 35, r2Max: 0)
        
        // From 480 to 751. Offset = -271
        let photo2YOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -271, r2Max: 0)
        
        // From 0 to 11. Offset = -11
        let photo2Rotation = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -11, r2Max: 0)
        
        // From 0 to 11. Offset = -11
        let photo2Scale = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        
        photo2.transform = CGAffineTransformMakeTranslation(photo2XOffset, photo2YOffset)
        photo2.transform = CGAffineTransformRotate(photo2.transform, CGFloat(Double(photo2Rotation) * M_PI / 180))
        photo2.transform = CGAffineTransformScale(photo2.transform, photo2Scale, photo2Scale)
        
        
        
        // -- Photo 3
        
        // From 172 to 202. Offset = -30 + (76/2) = 8
        let photo3XOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 8, r2Max: 0)
        
        // From 382 to 828. Offset = -271
        let photo3YOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -446, r2Max: 0)
        
        // From 0 to 10. Offset = 10
        let photo3Rotation = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        // From 132 to 76. Offset = 1.74
        let photo3Scale = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 1.74, r2Max: 1)
        
        photo3.transform = CGAffineTransformMakeTranslation(photo3XOffset, photo3YOffset)
        photo3.transform = CGAffineTransformRotate(photo3.transform, CGFloat(Double(photo3Rotation) * M_PI / 180))
        photo3.transform = CGAffineTransformScale(photo3.transform, photo3Scale, photo3Scale)
        
        
        
        // -- Photo 4
        
        // From 99 to 49 Offset = 50 + (76/2) = 96
        let photo4XOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 60, r2Max: 0)
        
        // From 484 to 905. Offset = -421
        let photo4YOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -411, r2Max: 0)
        
        // From 0 to 10. Offset = 10
        let photo4Rotation = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        // From 132 to 76. Offset = 1.74
        let photo4Scale = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 2, r2Max: 1)
        
        photo4.transform = CGAffineTransformMakeTranslation(photo4XOffset, photo4YOffset)
        photo4.transform = CGAffineTransformRotate(photo4.transform, CGFloat(Double(photo4Rotation) * M_PI / 180))
        photo4.transform = CGAffineTransformScale(photo4.transform, photo4Scale, photo4Scale)
        
        
        
        // -- Photo 5
        
        // From -36 to 125. Offset = -161 + (76/1.79) = 203
        let photo5XOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -118, r2Max: 0)
        
        // From 370 to 905. Offset = -535
        let photo5YOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -525, r2Max: 0)
        
        // From 0 to 10. Offset = 10
        let photo5Rotation = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        // From 136 to 76. Offset = 1.74
        let photo5Scale = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 1.79, r2Max: 1)
        
        photo5.transform = CGAffineTransformMakeTranslation(photo5XOffset, photo5YOffset)
        photo5.transform = CGAffineTransformRotate(photo5.transform, CGFloat(Double(photo5Rotation) * M_PI / 180))
        photo5.transform = CGAffineTransformScale(photo5.transform, photo5Scale, photo5Scale)
        
        
        
        // -- Photo 6
        
        // From 61 to 202. Offset = -141 + (76/1.68) = -95
        let photo6XOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -95, r2Max: 0)
        
        // From 390 to 905. Offset = -515
        let photo6YOffset = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -515, r2Max: 0)
        
        // From 0 to 10. Offset = 10
        let photo6Rotation = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        // From 128 to 76. Offset = 1.68
        let photo6Scale = convertValue(scrollViewYOffset, r1Min: 0, r1Max: 568, r2Min: 1.68, r2Max: 1)
        
        photo6.transform = CGAffineTransformMakeTranslation(photo6XOffset, photo6YOffset)
        photo6.transform = CGAffineTransformRotate(photo6.transform, CGFloat(Double(photo6Rotation) * M_PI / 180))
        photo6.transform = CGAffineTransformScale(photo6.transform, photo6Scale, photo6Scale)
        
    }
    

}
