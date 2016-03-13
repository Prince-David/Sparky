//
//  LoginViewController.swift
//  Sparky
//
//  Created by DAVID MAIMAN on 3/12/16.
//  Copyright © 2016 TeamSparky. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LOGIN"
        loginField.placeholder = "Username"
        passwordField.placeholder = "Password"
        UINavigationBar().backgroundColor = UIColor.redColor()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
//        // Do any additional setup after loading the view, typically from a nib.
//        var imgListArray :[UIImage] = []
//        for countValue in 1...7
//        {
//            
//            var strImageName : String = "dalmation-\(countValue).png"
//            var image  = UIImage(named:strImageName)
//            if image != nil{
//                imgListArray.append(image!)
//            }
//        }
//        
//        self.loginImage.animationImages = imgListArray;
//        self.loginImage.animationDuration = 1.0
//        self.loginImage.startAnimating()

    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //Call the login page
    @IBAction func loginButtonPushed(sender: AnyObject) {
        
    }
}