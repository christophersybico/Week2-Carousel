//
//  SignInViewController.swift
//  Week2-Carousel
//
//  Created by Sybico, Christopher on 9/26/15.
//  Copyright © 2015 Sybico, Christopher. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    //---------------------
    // Setup Sign In Form
    
    @IBOutlet weak var signInFormView: UIView!
    var signInFormViewInitialY: CGFloat!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    
    
    //--------------------------------------------
    // Setup Sign In Button
    
    @IBOutlet weak var signInButtonView: UIView!
    var signInButtonViewInitialY: CGFloat!
    
    
    
    //--------------------------------------------
    // Setup Email Required Alert
    
    let emailRequiredAlert = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
    
    // create an OK action
    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        // handle response here.
    }
    
    
    //--------------------------------------------
    // Setup Email Required Alert
    
    let signingInAlert = UIAlertController(title: nil, message: "Signing In...", preferredStyle: .Alert)

    
    
    //--------------------------------------------
    // Setup Email Required Alert
    
    let signInFailed = UIAlertController(title: "Sign In Failed", message: "Incorrect email or password", preferredStyle: .Alert)
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        

        // Save Y origins
        signInFormViewInitialY = signInFormView.frame.origin.y
        signInButtonViewInitialY = signInButtonView.frame.origin.y
        
        
        // Add the OK action to the alert controller
        emailRequiredAlert.addAction(OKAction)
        signInFailed.addAction(OKAction)
        
        
        // Keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    

    
    //--------------------------------------------
    // When keyboard will show
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    
        
        // Move signin form up
        self.signInFormView.frame.origin = CGPoint(x: self.signInFormView.frame.origin.x, y: 0)
        
        // Move signin button up
        self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: 227)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        
        // Move signin form down
        self.signInFormView.frame.origin = CGPoint(x: self.signInFormView.frame.origin.x, y: signInFormViewInitialY)
        
        // Move signin button down
        self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: signInButtonViewInitialY)
        
    }

    //--------------------------------------------
    // Hide keyboard when you tap outside the textfield
    
    @IBAction func didPressOutsideTextfield(sender: AnyObject) {
        emailField.endEditing(true)
        passwordField.endEditing(true)
    }
    
    //--------------------------------------------
    // Navigate back when you tap on back button
    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
        
    }
    
    
    //--------------------------------------------
    // When tap on Sign In Button
    
    @IBAction func didPressSignIn(sender: AnyObject) {
        
       
        if emailField.text == "" && passwordField.text == ""{
            self.presentViewController(self.emailRequiredAlert, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        else {
            presentViewController(signingInAlert, animated: true, completion: nil)
            
            delay(1){
                self.signingInAlert.dismissViewControllerAnimated(true, completion: nil)
                
                self.checkCredentials(self.emailField.text!, password: self.passwordField.text!)
            }
        }
        
    }
    
    func checkCredentials (email: String, password: String){
        if email == "chris@gmail.com" && password == "123qwe" {
            performSegueWithIdentifier("toTutorialSegue", sender: self)
        }
        else {
            presentViewController(signInFailed, animated: true, completion: nil)
        }
        
       
    }
    
}
