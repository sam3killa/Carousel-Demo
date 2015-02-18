//
//  SignInViewController.swift
//  Carousel Demo
//
//  Created by Samuel Shih on 2/2/15.
//  Copyright (c) 2015 Samuel Shih. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
  
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    
    var correctEmail = "samuels.shih@gmail.com"
    var correctPassword = "correct"
    
    // Create Alert
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        
        // Pop view controller when the back button is pressed
        navigationController!.popViewControllerAnimated(true)
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // Ends all editing
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == emailField {
            emailField.resignFirstResponder()
        } else {
            passwordField.resignFirstResponder()
        }
        return false
    }
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
       
        loadingView.startAnimating()
        
        if (emailField.text.isEmpty) {
            
            var emailMissingAlert = UIAlertView(title: "Email Required", message: "You must type in an email", delegate: nil, cancelButtonTitle: "Ok")
            emailMissingAlert.show()
            
            loadingView.stopAnimating()
            
        } else if (passwordField.text.isEmpty){
            
            var passwordMissingAlert = UIAlertView(title: "Password Required", message: "You must type in a password", delegate: nil, cancelButtonTitle: "Ok")
            passwordMissingAlert.show()
            
            loadingView.stopAnimating()
            
        } else {
            
            delay(2, { () -> () in
                
                if (self.emailField.text == "samuels.shih@gmail.com" && self.passwordField.text == "correct") {
                    self.performSegueWithIdentifier("signInSegue", sender: nil)
                    self.loadingView.stopAnimating()
                }
                else {
                    var incorrectAlert = UIAlertView(title: "Incorrect Login", message: "Please make sure you typed in the correct login information", delegate: nil, cancelButtonTitle: "Ok")
                    self.loadingView.stopAnimating()
                    incorrectAlert.show()
                }
                
            })
            
        }
        
        signInButton.enabled = true
    }
    
    @IBAction func forgotPasswordButtonPressed(sender: AnyObject) {
        
        
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
