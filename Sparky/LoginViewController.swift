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
        


    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //Call the login page
    @IBAction func loginButtonPushed(sender: AnyObject) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        self.navigationItem.hidesBackButton = true
        let welcomeView : WelcomeViewController = mainStoryboard.instantiateViewControllerWithIdentifier("welcomeView") as! WelcomeViewController

        welcomeView.navigationItem.hidesBackButton = true
        let navigationController = UINavigationController(rootViewController: welcomeView)
        navigationController.navigationBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        self.navigationController?.pushViewController(welcomeView, animated: true)

    }
}