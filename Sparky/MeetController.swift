//
//  MeetController.swift
//  Sparky
//
//  Created by DAVID MAIMAN on 3/12/16.
//  Copyright © 2016 TeamSparky. All rights reserved.
//

import UIKit

class MeetViewController: UIViewController {
    
    override func viewDidLoad() {
        
        self.navigationItem.hidesBackButton = true
        
    }
    @IBAction func backToWelcome(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        self.navigationItem.hidesBackButton = true
        let welcomeView : WelcomeViewController = mainStoryboard.instantiateViewControllerWithIdentifier("welcomeView") as! WelcomeViewController
        
        welcomeView.navigationItem.hidesBackButton = true
        let navigationController = UINavigationController(rootViewController: welcomeView)
        navigationController.navigationBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        self.navigationController?.pushViewController(welcomeView, animated: true)
    }
    @IBAction func touchSarah(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        self.navigationItem.hidesBackButton = true
        let planDay : DoctorDetailViewController = mainStoryboard.instantiateViewControllerWithIdentifier("DoctorDetail") as! DoctorDetailViewController
        
//        let navigationController = UINavigationController(rootViewController: planDay)
//        navigationController.navigationBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        
        
        self.navigationController?.pushViewController(planDay, animated: true)
    }
}