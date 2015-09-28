//
//  TutorialViewController.swift
//  Week2-Carousel
//
//  Created by Sybico, Christopher on 9/26/15.
//  Copyright © 2015 Sybico, Christopher. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageActionGroup: UIView!
    
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set up horizontal scroll view
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 320)
    
        // Set up "Take Carousel for a Spin"
        pageActionGroup.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = page
        
        print(page)
        
        if page == 3 {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.pageActionGroup.alpha = 1
            })
        }
        else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.pageActionGroup.alpha = 0
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
